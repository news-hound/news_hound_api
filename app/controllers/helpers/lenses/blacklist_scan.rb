module BlacklistScan

  def blacklist_scan
    return {blacklists: []} if @lens_ids.empty?

    matches = Blacklist
            .where(lens_id: @lens_ids)
            .joins(:domain)
            .where(domains: {name: @article['domain']})
            .includes(:lens)

    blacklists = matches.reduce([]) do |collection, blacklist|
      collection + [{
        id: blacklist.lens.id,
        name: blacklist.lens.name,
        message: blacklist.message
      }]
    end

    {blacklists: blacklists}
  end

end
