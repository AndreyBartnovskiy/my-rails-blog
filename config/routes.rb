Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  root to:"articles#index"

  resources :articles do 
    resources :publications, only: %i[create destroy]
  end

  resources :contacts, only: %i[new create thanks]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
