require 'rack'
require 'grape'
require File.expand_path('../SearchClient', __FILE__)
run SearchClient::API
