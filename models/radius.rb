class Radius
	attr_reader :original_code, :valid_codes
  def initialize(data)
  	@original_code = data[:query][:code]
  	@valid_codes = data[:results]
  end
end
