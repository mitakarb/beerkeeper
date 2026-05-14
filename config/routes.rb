Rails.application.routes.draw do
  root 'events#index'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'

  resources :sessions, only: %i[create destroy]
  resources :events do
    resources :participations, only: %i[create destroy]
    scope module: :events do
      resources :cancellations, only: %i[create]
    end
  end
  resource :user
end
