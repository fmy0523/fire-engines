Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # ログイン後投稿一覧画面へ
  root 'fire_engines#index'

  resources :fire_engines, only: [:new, :create, :index, :show] do
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
