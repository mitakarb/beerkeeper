Rails.application.routes.draw do
  root 'events#index'
  get 'login', to: 'sessions#new'
  resources :sessions, only: %i[create destroy]
  resources :events
  resources :users
end
