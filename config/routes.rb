Rails.application.routes.draw do
  root "welcome#index"

  resources :plays, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
  
end
