require 'sinatra/base'
require_relative 'application_controller'

class DistanceController < ApplicationController
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
