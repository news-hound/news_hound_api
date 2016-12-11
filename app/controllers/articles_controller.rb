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
    {
      url: decoded_url,
      lenses: params[:lenses],
      ai: params[:ai]
    }.reject { |k, v| v.nil? }
  end

  def decoded_url
    return nil if params[:url].nil?
    url = URI.unescape(params[:url])
    Embiggen::URI(url).expand.to_s
  end

end
