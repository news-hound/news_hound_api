class BlacklistsController < ApplicationController
  def create
    domain = Domain.find_by_url(strong_params[:url]) ||
             Domain.new(name: strong_params[:url])

    bl = Blacklist.new(message: strong_params[:message])
    bl.domain = domain
    bl.lens = current_lens

    if bl.save
      render json: {success: true}
    else
      render json: {
        success: false,
        messages: [bl.errors.full_messages]
      }
    end
  end

  private

  def strong_params
    params.require(:blacklist).permit(:url, :message)
  end
end
