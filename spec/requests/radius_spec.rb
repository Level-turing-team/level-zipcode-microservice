require "spec_helper"
require './app/controllers/radius_controller'
require './app/controllers/zipcode_controller'

RSpec.describe 'Radius API' do
	include Rack::Test::Methods
	def app
		RadiusController
	end
  
	it "returns closest zip codes in a given radius" do
    VCR.use_cassette('radius_1_cassette') do
		  get "/80238/2"
		  expect(json.class).to eq Hash
		  expect(json.keys.length).to eq 2
		  expect(json.keys).to eq ["original_code", "valid_codes"]
		  expect(json["valid_codes"].empty?).to eq false
		  expect(json["valid_codes"].length).to eq 29
    end
	end
  
	it 'returns a 404 if given incorrect starting zipcode' do
    VCR.use_cassette('radius_2_cassette') do
      get "/1111/2"
      
      expect(json["valid_codes"]).to have_key("error")
    end
  end
    
  it 'returns a 404 if given radius over 500 miles' do
    get "/80238/999"

	  expect(json["body"].keys.length).to eq 2
	  expect(json["body"]).to have_key("error")
	  expect(json["body"]["original_code"]).to be_nil
	end
end