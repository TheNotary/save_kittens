Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/admin'
  root to: 'pages#home'

  get 'pages/about'

  get 'data/fresh_data'
  get 'data/signatures_by_day_this_week'
  get 'thank_you' => 'pages#thank_you'

  get 'v' => 'data#version'

  resources :signatures
end

populate_database
