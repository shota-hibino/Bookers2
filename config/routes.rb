Rails.application.routes.draw do
  root to: 'homes#top'
  get "home/about" => "homes#about"

  devise_for :users

  resources :books, only: [:create, :edit, :index, :show, :update, :destroy]
  resources :users, only: [:create, :edit, :index, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
