Rails.application.routes.draw do
  devise_for :users
  # ログイン後投稿一覧画面へ
  root 'fire_engines#index'

  resources :fire_engines, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
