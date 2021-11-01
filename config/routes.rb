Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'index', to: 'porpoises#index'
end
