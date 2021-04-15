require 'sinatra'

class RadiusController < ZipcodeController

  get "/:code/:radius" do
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
end
