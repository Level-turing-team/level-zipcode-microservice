require 'sinatra/base'
require 'bundler'

Bundler.require

Dir.glob('./app/{controllers}/*.rb').each { |file| require file }

# map('/') { run ZipcodeController }
map('/distance') { run DistanceController }
map('/radius') { run RadiusController }

run Sinatra::Application
