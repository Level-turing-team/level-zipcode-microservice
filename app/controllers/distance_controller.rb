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
require './app/controllers/zipcode_controller'
require './app/controllers/radius_controller'

class DistanceController < ZipcodeController 
  get "/distance/:code/:compare" do
    response = conn.get("/api/v1/distance") do |f|
      f.params['code'] = params[:code]
      f.params['compare'] = params[:compare]
    end
    
    parsed = parse(response)
    @distance = Distance.new(parsed)
    content_type :json
    @distance.to_json
  end

  def conn
    conn = Faraday.new('https://app.zipcodebase.com', params: {apikey: ENV['ZIPCODEBASE_APIKEY'], unit: 'miles', country: 'us'})
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end