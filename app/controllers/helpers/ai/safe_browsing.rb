require 'net/http'
require 'json'

module SafeBrowsing

  def self.evaluate(url)

    data = {
      "client" => {
        "clientId" => "yourcompanyname",
        "clientVersion" => "1.5.2"
      },
      "threatInfo" => {
        "threatTypes" =>      ["MALWARE", "SOCIAL_ENGINEERING"],
        "platformTypes" =>    ["WINDOWS"],
        "threatEntryTypes" => ["URL"],
        "threatEntries" => [
          {"url" => url},
        ]
      }
    }.to_json

    uri = URI.parse("https://safebrowsing.googleapis.com/v4/threatMatches:find&key=AIzaSyC4GSInx50ydoI6ro2dF7-OvR7NGPglaww")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new("/v1.1/auth")
    request.add_field('Content-Type', 'application/json')
    request.body = data
    response = http.request(request)

    # uri = URI('https://safebrowsing.googleapis.com/v4/threatMatches:find')
    # params = {
    #   key: 'AIzaSyC4GSInx50ydoI6ro2dF7-OvR7NGPglaww'
    # }

    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.post_form(uri, data)

    p response.body

  end
end

# key - AIzaSyC4GSInx50ydoI6ro2dF7-OvR7NGPglaww
