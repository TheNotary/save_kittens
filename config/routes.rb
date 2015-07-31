Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/admin'
  root to: 'pages#home'

  get 'pages/about'

  get 'data/fresh_data'
  get 'thank_you' => 'pages#thank_you'

  resources :signatures
end

populate_database
