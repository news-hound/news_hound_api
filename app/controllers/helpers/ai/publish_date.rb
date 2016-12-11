module PublishDate

  def self.evaluate(article)
    date = article["whois"]["date"]
    if date > 6.months.ago
      { score: 0, messages: message("6 months") }
    elsif date > 1.year.ago
      { score: 0, messages: message("1 year") }
    elsif date > 2.years.ago
      { score: 0, messages: message("2 years") }
    elsif date > 3.years.ago
      { score: 0, messages: message("3 years") }
    else
      {score: 100, messages: []}
    end
  end

  def self.message(age)
    [{
      type: "ai",
      body: "is less than #{age} old - most legitimate news sources have been around much longer",
      author: "News Hound"
    }]
  end
end
