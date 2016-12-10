module ConceptScan

  def concept_scan
    return {concepts: []} if @lens_ids.empty?

    matches = Concept
      .where("keywords <@ ARRAY[?]::varchar[]", @article["keywords"])
      .where(lens_id: @lens_ids)
      .includes(:lens)

    concepts = matches.reduce([]) do |collection, concept|
      collection + [{
        id: concept.lens.id,
        name: concept.lens.name,
        message: concept.message
      }]
    end

    {concepts: concepts}
  end
end
