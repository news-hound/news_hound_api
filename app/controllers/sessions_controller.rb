class SessionsController < ApplicationController

  # valid session_token?
  def show
    success = !!current_lens
    render json: { success: success }
  end

  # log in
  def create
    # debugger
    lens = Lens.find_by_credentials(
      strong_params[:name],
      strong_params[:password]
    )
    if lens
      render json: {
        sessionToken: lens.reset_session_token!,
        success: true
      }
    else
      render json: {
        success: false,
        messages: ["Invalid log in credentials"]
      }
    end
  end

  # log out
  def destroy
    if current_lens
      current_lens.reset_session_token!
    end
    render json: { success: true }
  end

  def strong_params
    params.require(:lens).permit(:name, :password)
  end

end
