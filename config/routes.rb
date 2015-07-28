Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'

  get 'pages/about'

  get 'data/fresh_data'

  resources :signatures, :only => [:create]
end
