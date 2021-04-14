require 'sinatra'
require 'dotenv'
require 'dotenv/load'
require 'pry'
require 'faraday'
require 'json'
require 'fast_jsonapi'
require './models/distance'

get "/distance/:code/:compare" do
  if params[:code].nil? || params[:compare].nil?
    halt 400, json("Bad request")
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

private

def conn
  conn = Faraday.new('https://app.zipcodebase.com', params: {apikey: ENV['ZIPCODEBASE_APIKEY'], unit: 'miles', country: 'us'})
end

def parse(response)
  JSON.parse(response.body, symbolize_names: true)
end
