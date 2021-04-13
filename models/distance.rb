class Distance
  attr_reader :original_code, :distance
  def initialize(data)
    @original_code = data[:query][:code]
    @distance = data[:results]
  end
end
