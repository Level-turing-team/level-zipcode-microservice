require 'sinatra'
require 'bundler'
require './zipcode_base_api'
Bundler.require
run Sinatra::Application
