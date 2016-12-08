require 'net/http'
require 'json'

MESSAGES = {
  "101" => "contain malware or viruses",
  "103" => "be phishing for your information",
  "104" => "be a scam",
  "105" => "engage in illegal behavior",
  "201" => "contain intentionally misleading or unethical claims",
  "203" => "looks suspicious - it may be trying to trick you"
}

host = 'abcnews.com.co'
uri = URI('http://api.mywot.com/0.4/public_link_json2')

params = {
  key: 'a02997f4c97c298c63d1f89445626edc3c5d83d0',
  hosts: host + '/'
}

uri.query = URI.encode_www_form(params)

data = Net::HTTP.get(uri)

result = JSON.parse(data)

trust, confidence = result[host]["0"]
