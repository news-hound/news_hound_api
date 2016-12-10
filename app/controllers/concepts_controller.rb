class ConceptsController < ApplicationController
  def create
    concept = Concept.new(
      keywords: params[:keywords],
      message: params[:message],
    )

    concept.lens = current_lens

    if concept.save
      render json: {success: true}
    else
      render json: {
        success: false,
        messages: concept.errors.full_messages
      }
    end
  end

end
