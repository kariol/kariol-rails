Rails.application.routes.draw do
  root to: 'pages#home'
  get 'entreprise', to: 'pages#enterprise'
  get 'legal', to: 'pages#legal'

  resources :commute_requests, only: [ :create ]
end
