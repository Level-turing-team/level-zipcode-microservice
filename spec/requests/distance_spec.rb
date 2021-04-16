require "spec_helper"

RSpec.describe 'Distance API' do
	include Rack::Test::Methods
	def app
		DistanceController 
	end
	it "returns me json that is a hash with 2 keys" do
    VCR.use_cassette('distance_1_cassette') do
      
      get "/80238/01609"
      expect(json.class).to eq Hash
      expect(json.keys.length).to eq 2
      expect(json.keys).to eq ["original_code", "distance"]
    end
	end
  
	it 'returns an empty array if given incorrect starting zipcode' do
      get "/00000/"
      expect(last_response.status).to eq(404)
  end

	it 'returns bad request if no params given' do
      get "/distance"
      expect(last_response.status).to eq(404)
  end
    
  it 'returns an empty array if given incorrect ending zipcode' do
    VCR.use_cassette('distance_3_cassette') do
	    get "/11111/sdfg"
      expect(last_response.status).to eq(200)
      expect(json['distance']).to eq([])
    end
  end
end
