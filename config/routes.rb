Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'

  get 'pages/about'

  resources :signatures
end
