Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    passwords:     'users/passwords',
  }

  root 'home#top'
  get 'home/top'
  resources :users, only: [:index, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :recipes
  resources :relationships, only: [:create, :destroy]

  # users以下のコントローラーを探しに行く記述
  resources :users, only: [:index] do
    scope module: :users do 
      resource :profiles, only: [:show, :edit, :update]
      resource :accounts, only: [:show, :edit, :update]
      # ユーザー一人から見て一つしかないようなリソースの場合は単数。resourceにindexは含まれないのでresourcesとする
      resources :recipes, only: [:index]
    end 
  end

  get :favorites, to: 'favorites#index'
  post   "favorites/:recipe_id/create"  => "favorites#create"
  delete "favorites/:recipe_id/destroy" => "favorites#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end