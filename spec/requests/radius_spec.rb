require "spec_helper"
require './zipcode_base_api'

RSpec.describe 'Distance API' do
	include Rack::Test::Methods
	def app
		Sinatra::Application
	end
	it "returns merchants sorted by the number of items sold" do
		get "/distance/80238/01609"
		expect(json.class).to eq Hash
		expect(json.keys.length).to eq 2
		expect(json.keys).to eq ["original_code", "distance"]
	end
end
