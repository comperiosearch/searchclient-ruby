# config.ru
require 'rack'
require 'grape'
require '.\Front.rb'
run Front::API 