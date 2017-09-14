Rails.application.routes.draw do

  get 'chats/new'

  root 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  resources :messages, only: :create
  resources :chats, only: [:create, :new, :show]
  
end