
require_relative 'article_content'
require_relative 'lenses/blacklist_scan'
require_relative 'lenses/concept_scan'
require_relative 'ai/ai_scan'
require_relative 'util/fetch_error'

class ArticleManager
  include BlacklistScan
  include ConceptScan
  include AiScan

  def initialize(url: nil, lenses: [], ai: false)
    @url, @lens_ids, @ai = url, lenses, ai
    @lens_ids.map!(&:to_i)
  end

  def evaluate
    # TODO clean please :) score calculation is finiky
    begin
      @article = ArticleContent.extract(@url)
      return {} if !@url || (@lens_ids.empty? && !@ai)
      zero_out = false
      score_count = 0

      result = {
        success: true,
        score: 0,
        messages: []
      }

      [blacklist_scan, concept_scan, ai_scan].each do |scan|
        result[:score] += scan[:score] || 0
        score_count += 1 if scan[:score]
        result[:messages] += scan[:messages]
        zero_out ||= scan[:zero]
      end

      result[:score] /= score_count
      result[:score] = 0 if zero_out

      result

    rescue FetchError => err
      puts "\n#{err}\n"
      {
        success: false,
        error: "unable to parse article",
        messages: [err]
      }
    end
  end
end
