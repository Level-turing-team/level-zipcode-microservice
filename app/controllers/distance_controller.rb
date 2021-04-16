require 'sinatra/base'
require './app/controllers/zipcode_controller'
require './app/controllers/radius_controller'

class DistanceController < ZipcodeController
  get "/:code/:compare" do
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