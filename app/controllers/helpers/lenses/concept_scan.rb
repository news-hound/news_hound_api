module ConceptScan

  def concept_scan
    return {messages: []} if @lens_ids.empty?

    matches = Concept
      .where("keywords <@ ARRAY[?]::varchar[]", @article["keywords"])
      .where(lens_id: @lens_ids)
      .includes(:lens)

    @messages = matches.reduce([]) do |collection, concept|
      # TODO! add reference capability for concepts
      collection + [{
        id: concept.lens.id,
        type: "concept",
        body: concept.message,
        author: concept.lens.name,
        reference: nil
      }]
    end

    {messages: @messages, score: score}
  end

  def score
    100 - (@messages.length * 20)
  end
end
