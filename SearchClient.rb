# encoding: UTF-8
require 'elasticsearch'
require 'dotenv'
require 'hashie'
require 'httparty'
require 'uri'

module SearchClient

  class API < Grape::API

    helpers do
      logger = Logger.new('query.log', 'daily')
      def logger
        API.logger
      end
    end

    version 'v1', using: :header, vendor: 'Comperio'
    format :json
    content_type :json, "application/json;charset=UTF-8"

    get :search do
      begin
        envfile = File.expand_path('../.env', __FILE__)
        Dotenv.load(envfile)
        size=20
        query  = params["query"]
        unless params["size"].to_s.empty?
          size = params["size"]
        end
        queryOho = {query: query,
                    size: size,
                    logger: logger}
        # To allow using as an endpoint for ajax
        #        header "Access-Control-Allow-Origin","*"
        response = Search.execute(queryOho)
        logger.info("{Query:#{query}, Hits:" + response["hits"]["total"].to_s + ' +}')
        {:result => response}

      end
    end
  end

  class Search

    def self.execute(queryOho)
      client = Elasticsearch::Client.new host: ENV['ES_SERVER'], log: false
      query  = queryOho[:query]
      size = queryOho[:size]
      logger = queryOho[:logger]
      searchReq = {
        size: size,
        query: {
          match: {
            _all: query
          }
        }
      }
      logger.debug(searchReq)
      response = client.search index: ENV['ES_INDEX'], body: searchReq
      return response
    end

  end


end

