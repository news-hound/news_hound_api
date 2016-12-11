module BlacklistScan

  def blacklist_scan
    return { messages: [], zero: false } if @lens_ids.empty?

    matches = Blacklist
            .where(lens_id: @lens_ids)
            .joins(:domain)
            .where(domains: {name: @article['domain']})
            .includes(:lens)

    messages = matches.reduce([]) do |collection, blacklist|
      collection + [{
        lens_id: blacklist.lens.id,
        type: "blacklist",
        body: blacklist.message,
        author: blacklist.lens.name,
        reference: blacklist.rebuttal.try(:url) #rebuttal might not exist
      }]
    end

    { messages: messages, zero: !messages.empty? }
  end

end
