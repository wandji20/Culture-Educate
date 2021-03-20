Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :create, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, only: [:new, :create, :destroy, :edit]
  # get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'new_login', to: 'sessions#new', as: 'new_login'
  # post 'login', to: 'sessions#create', as: 'login'
end
