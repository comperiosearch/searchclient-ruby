require 'elasticsearch'
require 'dotenv'

module Front
  class API < Grape::API

    version 'v1', using: :header, vendor: 'Comperio'
    format :json

    
      get ':search' do
        client = Elasticsearch::Client.new ENV['ES_SERVER'] log: true
        
        response = client.search index: ENV['ES_INDEX'],
                         body: {   query: 
                                  { match: {_all:params["query"] } 
                                  }
                              }
        {:result => response}

      end
    end
  end


