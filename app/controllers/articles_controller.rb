class ArticlesController < ApplicationController

  VERIFICATIONS = [WebOfTrust, MisleadingUrl, PublishDate, ContactEmail,
                   TitleSummaryMatch]

  def evaluate
    if !url
      render json: {}
      return
    end

    article = ArticleContent.extract(url)
    result = {}

    if ai?
      WhoIs.addContent!(article)

      ai_result = {"score" => 0, "messages" => []}
      VERIFICATIONS.each do |mod|
        evaluation = mod.evaluate(article)
        ai_result["score"] += evaluation["score"] / VERIFICATIONS.length.to_f
        ai_result["messages"] += evaluation["messages"]
      end
      result["ai"] = ai_result
    end

    if lenses?
      result["lenses"] = []
      lenses = Lens.where(id: lens_ids)
      lenses.each do |lens|
        result["lenses"] << lens.evaluate(article)
      end
    end

    render json: result
  end

  private

  def url
    params[:url]
  end

  def lens_ids
    ids = params[:lenses] || []
    ids.map(&:to_i)
  end

  def lenses?
    !!params[:lenses]
  end

  def ai?
    !!params[:ai]
  end
end
