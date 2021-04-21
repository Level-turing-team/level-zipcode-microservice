require 'sinatra/base'
require 'bundler'
# require_relative 'zipcode_base_api'
require './app/controllers/distance_controller'
require './app/controllers/radius_controller'
require './app/controllers/zipcode_controller'
Bundler.require
Dir.glob('./app/{controllers}/*.rb').each { |file| require file }
map('/api/v1/distance') { run DistanceController }
map('/api/v1/radius') { run RadiusController }
run Sinatra::Application

