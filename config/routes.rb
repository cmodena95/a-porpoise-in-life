Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'index', to: 'porpoises#index'
  get 'porpoises/new', to: 'porpoises#new'
  post 'porpoises', to: 'porpoises#create'
  get 'porpoises/:id', to: 'porpoises#show', as: :porpoise
  get 'porpoises/:id/edit', to: 'porpoises#edit', as: :edit_porpoise
  patch 'porpoises/:id', to: 'porpoises#update'
end
