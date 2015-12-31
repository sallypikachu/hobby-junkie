Rails.application.routes.draw do
  root to: "homes#home"
  get '/auth/github/callback', to: 'sessions#github'
  get '/sign_out', to: 'sessions#destroy'
  resources :hobbies, only: [:index, :show, :new, :create] do
    resources :tasks, except: :index
  end
end
