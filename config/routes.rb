Rails.application.routes.draw do
  root 'hobbies#index'
  resources :hobbies, only: [:index, :show, :new, :create]
end
