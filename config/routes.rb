Rails.application.routes.draw do
  get :evaluate, to: "articles#evaluate"

  resources :blacklists, only: [:create]
  resources :concepts, only: [:create]
  resource :session, only: [:create, :destroy, :show]
end
