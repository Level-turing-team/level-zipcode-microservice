require 'sinatra'

class DistanceController < ZipcodeController

  get "/:code/:compare" do
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

end
