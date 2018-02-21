Rails.application.routes.draw do
  root "welcome#index"

  resources :plays, only: [:index, :create]
end
