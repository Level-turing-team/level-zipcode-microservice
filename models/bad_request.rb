class BadRequest
	attr_reader :body
  def initialize
  	@body = {
  		original_code: nil,
  		error: "Invalid Request"
  	}
  end
end
