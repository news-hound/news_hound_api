module MisleadingUrl

  DOMAINS = %w(com org net)
  MSG = {
    type: "ai",
    body: "contains a misleading domain - it may not be the organization you think it is",
    author: "News Hound"
  }

  def self.evaluate(article)
    url = article['domain']
    if DOMAINS.any? { |domain| url.include?(".#{domain}.")}
      { score: 0, messages: [MSG] }
    else
      { score: 100, messages: [] }
    end
  end
end
