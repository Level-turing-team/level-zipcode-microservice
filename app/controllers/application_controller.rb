require 'sinatra'
require 'sinatra/base'
require 'dotenv'
require 'dotenv/load'
require 'pry'
require 'faraday'
require 'json'
require 'fast_jsonapi'
require './models/distance'
require './models/radius'
require './models/bad_request'
require './app/controllers/distance_controller'

class ApplicationController < Sinatra::Base
  def conn
    conn = Faraday.new('https://app.zipcodebase.com', params: {apikey: ENV['ZIPCODEBASE_APIKEY'], unit: 'miles', country: 'us'})
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
