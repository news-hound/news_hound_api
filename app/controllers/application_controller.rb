class ApplicationController < ActionController::API

  def current_lens
    Lens.first
  end
end
