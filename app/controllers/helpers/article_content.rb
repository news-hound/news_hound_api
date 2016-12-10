
require_relative 'util/fetch'

module ArticleContent
  extend Fetch

  ENDPOINT = 'https://gateway-a.watsonplatform.net/calls/url/URLGetCombinedData'

  API_CONFIG = {
    apikey: ENV['watson_key'],
    outputMode: 'json',
    showSourceText: '1',
    extract: 'authors, keywords, title'
  }

  def self.extract(url)
    params = API_CONFIG.merge({ url: url })

    response = fetch(ENDPOINT, params)

    response = minimize(response)
    response['url'] = clean_url(url)
    response['domain'] = domain(response['url'])

    response
  end

  # Select only the relevant information, limit keywords to 10
  def self.minimize(response)
    response = response.extract!('text', 'title', 'authors', 'keywords')
    response['keywords'] = response['keywords'].take(10)
    response['keywords'].map! { |data| data['text'] }
    response
  end

  # Remove the protocol prefix and query string from url
  def self.clean_url(url)
    url = url.gsub("http://", "").gsub("https://", "")
    url = url.split("?").first
    url[-1] == "" if url[-1] == "/"
    url
  end

  # Extract the domain from the url
  def self.domain(url)
    root = ""
    idx = 0
    until url[idx] == "/" || idx == url.length
      root << url[idx]
      idx += 1
    end
    root
  end
end
