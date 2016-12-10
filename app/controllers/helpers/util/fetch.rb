require_relative 'fetch_error'

module Fetch
  def fetch(api, params)
    query = api + '?' + URI.encode_www_form(params)
    response = HTTP.get(query)
    json = JSON.parse(response.to_s)

    if response.status != 200 || json['status'] == 'ERROR'
      raise FetchError, "unable to fetch from #{api}"
    end

    json
  end
end
