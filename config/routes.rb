Rails.application.routes.draw do
  root to: "hobbies#index"
  get '/auth/github/callback', to: 'sessions#github'
  get '/sign_out', to: 'sessions#destroy'
  resources :hobbies, only: [:index, :show, :new, :create]
end
