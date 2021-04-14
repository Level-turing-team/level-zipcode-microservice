require 'sinatra'
require 'dotenv'
require 'dotenv/load'
require 'pry'
require 'faraday'
require 'json'
require 'fast_jsonapi'
require './models/distance'
require './models/radius'
require './models/bad_request'

get "/distance/:code/:compare" do
  if params[:code].nil? || params[:compare].nil?
    @error = BadRequest.new
    content_type :json
    @error.to_json
  else
    response = conn.get("/api/v1/distance") do |f|
      f.params['code'] = params[:code]
      f.params['compare'] = params[:compare]
    end
    parsed = parse(response)
    @distance = Distance.new(parsed)
    content_type :json
    @distance.to_json
  end
end
# adius?apikey=YOUR-APIKEY&code=10005&radius=100&country=us
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

private

def conn
  conn = Faraday.new('https://app.zipcodebase.com', params: {apikey: ENV['ZIPCODEBASE_APIKEY'], unit: 'miles', country: 'us'})
end

def parse(response)
  JSON.parse(response.body, symbolize_names: true)
end
