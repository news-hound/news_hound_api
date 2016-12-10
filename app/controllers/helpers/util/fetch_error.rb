class FetchError < StandardError
  def initialize(msg="Unable to fetch")
    super
  end
end
