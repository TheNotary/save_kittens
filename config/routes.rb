Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'

  get 'pages/about'

  get 'data/fresh_data'
  get 'thank_you' => 'pages#thank_you'

  resources :signatures, :only => [:create]
end
