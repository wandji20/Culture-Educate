Rails.application.routes.draw do
  get 'votes/new'
  get 'votes/create'
  get 'votes/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :users, only: [:index, :create, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, only: [:new, :create, :destroy, :edit]
  resources :categories, only: [:show]
  resources :votes, only: [ :create, :destroy]
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'new_login', to: 'sessions#new', as: 'new_login'
  # post 'login', to: 'sessions#create', as: 'login'
end
