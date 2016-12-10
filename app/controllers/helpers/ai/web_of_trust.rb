require_relative '../util/fetch'

module WebOfTrust
  extend Fetch

  MESSAGES = {
    "101" => "may contain malware or viruses",
    "103" => "may be phishing for your information",
    "104" => "may be a scam",
    "105" => "may engage in illegal behavior",
    "201" => "may contain intentionally misleading or unethical claims",
    "203" => "looks suspicious - it may be trying to trick you"
  }

  ENDPOINT = 'http://api.mywot.com/0.4/public_link_json2'

  API_CONFIG = {
    key: ENV['wot_key']
  }

  def self.evaluate(url_data)
    domain = url_data['domain']

    params = API_CONFIG.merge({ hosts: domain + '/' })

    result = fetch(ENDPOINT, params)[domain]

    { "score" => score(result), "messages" => messages(result) }
  end

  def self.messages(result)
    messages = result["categories"] || []
    messages.map { |k, _| MESSAGES[k] }.compact
  end

  def self.score(result)
    result.fetch("0", []).first
  end
end
