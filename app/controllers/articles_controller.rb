require 'helpers/article_manager'

class ArticlesController < ApplicationController

  # VERIFICATIONS = [WebOfTrust, MisleadingUrl, PublishDate, ContactEmail,
  #                  TitleSummaryMatch]

  def evaluate
    # if !params[:url]
    #   render json: {}
    #   return
    # end

    # article = ArticleContent.extract(url)
    # result = {}
    am = ArticleManager.new(strong_params)
    render json: am.evaluate

    # if ai?
    #   WhoIs.addContent!(article)
    #
    #   ai_result = {"score" => 0, "messages" => []}
    #   VERIFICATIONS.each do |mod|
    #     evaluation = mod.evaluate(article)
    #     ai_result["score"] += evaluation["score"] / VERIFICATIONS.length.to_f
    #     ai_result["messages"] += evaluation["messages"]
    #   end
    #   result["ai"] = ai_result
    # end
    #
    # if lenses?
    #   result["blacklists"] = BlacklistScan.evaluate(article, lens_ids)
    #   result["concepts"] = ConceptScan.evaluate(article, lens_ids)
    # end
    #
    # render json: result
  end

  private

  def strong_params
    {
      url: params[:url],
      lenses: params[:lenses],
      ai: params[:ai]
    }.reject { |k, v| v.nil? }
  end

  # def url
  #   params[:url]
  # end
  #
  # def lens_ids
  #   ids = params[:lenses] || []
  #   ids.map(&:to_i)
  # end
  #
  # def lenses?
  #   !!params[:lenses]
  # end
  #
  # def ai?
  #   !!params[:ai]
  # end

end
