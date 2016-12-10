
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
    begin
      @article = ArticleContent.extract(@url)
      return {} if !@url || (@lens_ids.empty? && !@ai)
      result = {success: true}

      result.merge(blacklist_scan)
            .merge(concept_scan)
            .merge(ai_scan)
    rescue FetchError => e
      puts e
      {
        success: false,
        error: "unable to parse article"
      }
    end
  end
end
