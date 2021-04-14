require "spec_helper"
require './zipcode_base_api'

RSpec.describe 'Radius API' do
	include Rack::Test::Methods
	def app
		Sinatra::Application
	end
	it "returns closest zip codes in a given radius" do
		get "/radius/80238/2"
		expect(json.class).to eq Hash
		expect(json.keys.length).to eq 2
		expect(json.keys).to eq ["original_code", "valid_codes"]
		expect(json["valid_codes"].empty?).to eq false
		expect(json["valid_codes"].length).to eq 29
	end


	it 'returns a 404 if given incorrect starting zipcode' do
		get "/radius/1111/2"

		expect(json["valid_codes"]).to have_key("error")
	end

	it 'returns a 404 if given radius over 500 miles' do
		get "/radius/80238/999"
		expect(json["body"].keys.length).to eq 2
		expect(json["body"]).to have_key("error")
		expect(json["body"]["original_code"]).to be_nil
	end
end
