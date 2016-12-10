class ApplicationController < ActionController::API

  def current_lens
    token = request.headers["Authorization"]
    @cl ||= Lens.find_by(session_token: token)
  end

  def ensure_login
    if !current_lens
      render json: {
        success: false,
        messages: ["You must be logged in to do that"]
      }
    end
  end
end
