Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    passwords:     'users/passwords',
  }

  root 'home#top'
  get 'home/top'
  resources :users, only: [:index]

  # users以下のコントローラーを探しに行く記述
  resources :users, only: [:index] do
    scope module: :users do 
      resource :profiles, only: [:show, :edit, :update]
      resource :accounts, only: [:show, :edit, :update]
    end 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end