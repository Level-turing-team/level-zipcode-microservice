require "spec_helper"
require './zipcode_base_api'
require './models/bad_request'

RSpec.describe BadRequest do

	it "has attributes" do
		sample_error = BadRequest.new

		expect(sample_error.body).to eq({
  		original_code: nil,
  		error: "Invalid Request"
  	})
	end
end
