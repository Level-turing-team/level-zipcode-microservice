require "spec_helper"
require './zipcode_base_api'
require './models/radius'

RSpec.describe Radius do

	it "has attributes" do
		sample_json = {:query=>{:code=>"80238", :unit=>"miles", :radius=>"15", :country=>"us"},
 :results=>
  [{:code=>"80208", :city=>"Denver", :state=>"CO", :city_en=>nil, :state_en=>nil, :distance=>0},
   {:code=>"80217", :city=>"Denver", :state=>"CO", :city_en=>nil, :state_en=>nil, :distance=>0},
   {:code=>"80238", :city=>"Denver", :state=>"CO", :city_en=>nil, :state_en=>nil, :distance=>0}]}
		sample_radius = Radius.new(sample_json)

		expect(sample_radius.original_code).to eq("80238")
		expect(sample_radius.valid_codes).to eq(  [{:code=>"80208", :city=>"Denver", :state=>"CO", :city_en=>nil, :state_en=>nil, :distance=>0},
   {:code=>"80217", :city=>"Denver", :state=>"CO", :city_en=>nil, :state_en=>nil, :distance=>0},
   {:code=>"80238", :city=>"Denver", :state=>"CO", :city_en=>nil, :state_en=>nil, :distance=>0}])
	end
end
