Rails.application.routes.draw do
  # top画面を/のルートに設定
  root to: 'homes#top'
  # aboutのルート作成
  get "home/about" => "homes#about"

  devise_for :users

  resources :books, only: [:create, :edit, :index, :show, :update, :destroy]
  resources :users, only: [:create, :edit, :index, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
