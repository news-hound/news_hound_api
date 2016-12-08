module ContactEmail

  MESSAGE = "may be operated by a single person, not an organization - this site is opperated by "
  PUBLIC_EMAIL_DOMAINS = %w(gmail.com yahoo.com outlook.com inbox.com mail.com
                            yandex.com aim.com aol.com gmx.com)

  def self.evaluate(article)
    if PUBLIC_EMAIL_DOMAINS.any? do |domain|
        article['whois']['email'].ends_with?(domain)
      end
      name = article['whois']['name']
      { "score" => 0, "messages" => [MESSAGE + name] }
    else
      { "score" => 100, "messages" => [] }
    end
  end
end
