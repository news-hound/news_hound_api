module TitleSummaryMatch

  MESSAGE = "The article's title doesn't seem to match it's content"

  def self.evaluate(article)
    title = article['title'].downcase
    keywords = article['keywords'].map(&:downcase)
    score = 0

    keywords.each do |phrase|
      score += 5 if title.include?(phrase)
      phrase.split.each do |word|
        score += 2 if title.include?(word)
      end
    end

    score = score / keywords.length.to_f * 100
    score = score.to_i

    if score < 100
      { "score" => score, "messages" => [MESSAGE] }
    else
      { "score" => 100, "messages" => [] }
    end
  end
end
