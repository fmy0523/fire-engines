Rails.application.routes.draw do

  root 'homes#top'

  devise_for :users
  get 'home/about' => 'homes#about'

  resources :fire_engines do
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

  post 'reports/new' => 'reports#new'
  get 'report/complete' => 'reports#complete'
  resources :reports, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
