Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to:"articles#index"

  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
