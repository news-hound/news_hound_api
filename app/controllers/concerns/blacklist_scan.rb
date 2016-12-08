module BlacklistScan

  def self.evaluate(article)
    bl_ids = article["blacklists"]
    bls = Blacklist
            .where(domain: article['domain'])
            .where(lens_id: bl_ids)
            .includes(:lens)
    if bls
      [0, compile_messages(bls)]
    else
      [100, []]
    end
  end

  def self.compile_messages(bls)
    messages = Hash.new { [] }
    bls.each do |blacklist|
      messages[blacklist.lens.name] += [blacklist.message]
    end

    messages
  end
end
