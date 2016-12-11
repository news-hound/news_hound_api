require_relative 'contact_email'
require_relative 'misleading_url'
require_relative 'publish_date'
require_relative 'title_summary_match'
require_relative 'web_of_trust'
require_relative 'who_is'

module AiScan

  VERIFICATIONS = [WebOfTrust, ContactEmail, MisleadingUrl, PublishDate,
                   TitleSummaryMatch]

  def ai_scan
    return {score: 100, messages: []} unless @ai

    WhoIs.addContent!(@article)
    ai_result = {score: 0, messages: []}

    VERIFICATIONS.each do |mod|
      evaluation = mod.evaluate(@article)
      ai_result[:score] += evaluation[:score] / VERIFICATIONS.length
      ai_result[:messages] += evaluation[:messages]
    end

    ai_result
  end
end
