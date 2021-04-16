require 'sinatra/base'
require 'bundler'
# require_relative 'zipcode_base_api'
require './app/controllers/distance_controller'
require './app/controllers/radius_controller'
require './app/controllers/zipcode_controller'
Bundler.require
run Sinatra::Application

