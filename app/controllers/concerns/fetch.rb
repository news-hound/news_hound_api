module Fetch
  def fetch(api, params)
    query = api + '?' + URI.encode_www_form(params)
    response = HTTP.get(query)
    JSON.parse(response.to_s)
  end
end
