require "spec_helper"
require './zipcode_base_api'
require './models/distance'

RSpec.describe Distance do

	it "has attributes" do
		sample_json = {
			:query=>{:unit=>"miles", :code=>"80238", :country=>"us", :compare=>["01609"]},
			:results=>{:"01609"=>1727.12}
		}
		sample_distance = Distance.new(sample_json)

		expect(sample_distance.original_code).to eq("80238")
		expect(sample_distance.distance).to eq({:"01609"=>1727.12})
	end
end
