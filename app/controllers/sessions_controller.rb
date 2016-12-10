class SessionsController < ApplicationController

  # log in
  def create
    lens = Lens.find_by_credentials(
      strong_params[:name],
      strong_params[:password]
    )
    if lens
      response.headers["Authorization"] = lens.session_token
      render json: {
        success: true,
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
