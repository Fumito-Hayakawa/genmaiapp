Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
  }
  root 'home#top'
  get 'home/top'
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end