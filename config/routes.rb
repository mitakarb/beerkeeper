Rails.application.routes.draw do
  root 'events#index'
  get 'login', to: 'sessions#new'
<<<<<<< HEAD
=======
  get 'signup', to: 'users#new'
>>>>>>> 1e18010 (Merge branch 'master' into add-registration)
  resources :sessions, only: %i[create destroy]
  resources :events do
    resources :participations, only: %i[create destroy]
  end
  resources :users
end
