module MisleadingUrl

  DOMAINS = %w(com org net)
  MSG = "contains a misleading domain - it may not be the organization you think it is"

  def self.evaluate(article)
    url = article['domain']
    if DOMAINS.any? { |domain| url.include?(".#{domain}.")}
      { "score" => 0, "messages" => [MSG] }
    else
      { "score" => 100, "messages" => [] }
    end
  end
end
