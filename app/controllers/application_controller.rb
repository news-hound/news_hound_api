class ApplicationController < ActionController::API

  def current_lens
    @cl ||= Lens.find_by(session_token: session[:session_token])
  end
end
