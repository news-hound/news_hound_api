require 'helpers/article_manager'

class ArticlesController < ApplicationController

  # VERIFICATIONS = [WebOfTrust, MisleadingUrl, PublishDate, ContactEmail,
  #                  TitleSummaryMatch]

  def evaluate

    if params[:fake]
      render "fake.json.jbuilder"
      return
    end

    am = ArticleManager.new(strong_params)
    render json: am.evaluate

  end

  private

  def strong_params
    url = URI.unescape(params[:url])
    url = Embiggen::URI(url).expand.to_s
    {
      url: url,
      lenses: params[:lenses],
      ai: params[:ai]
    }.reject { |k, v| v.nil? }
  end

end
