Rails.application.routes.draw do
  root 'events#index'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'registrations#new'
  resources :sessions, only: %i[create destroy]
  resources :events do
    resources :participations, only: %i[create destroy]
  end
  resource :users
end
