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
require './app/controllers/zipcode_controller'

class RadiusController < ZipcodeController
  get "/radius/:code/:radius" do
    if params[:radius].to_i.zero? || params[:radius].to_i >= 500
      @error = BadRequest.new
      content_type :json
      @error.to_json
    else
      response = conn.get("/api/v1/radius") do |f|
        f.params['code'] = params[:code]
        f.params['radius'] = params[:radius]
      end
  
      parsed = parse(response)
      @radius = Radius.new(parsed)
      content_type :json
      @radius.to_json
    end
  end

  def conn
    conn = Faraday.new('https://app.zipcodebase.com', params: {apikey: ENV['ZIPCODEBASE_APIKEY'], unit: 'miles', country: 'us'})
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end