module WhoIs
  extend Fetch

  ENDPOINT = 'http://www.whoisxmlapi.com/whoisserver/WhoisService'

  API_CONFIG = {
    username: ENV['whois_un'],
    password: ENV['whois_pw'],
    outputFormat: 'JSON'
  }

  def self.addContent!(article)

    params = API_CONFIG.merge({domainName: article['domain']})
    response = fetch(ENDPOINT, params)['WhoisRecord']

    whois = {
      'date' => date(response),
      'email' => email(response),
      'name' => name(response)
    }

    article.merge!({'whois' => whois})
  end

  def self.date(response)
    date_string = response['registryData']['createdDate']
    Date.parse(date_string)
  end

  def self.email(response)
    response['contactEmail']
  end

  def self.name(response)
    name1 = response.fetch('registryData', {})
                    .fetch('administrativeContact', {})
                    .fetch('name', nil)

    name2 = response.fetch('administrativeContact', {})
                    .fetch('name', nil)

    name1 || name2
  end
end
