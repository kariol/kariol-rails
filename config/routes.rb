Rails.application.routes.draw do
  require 'sidekiq/web'
  # authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  # end

  mount ForestLiana::Engine => '/forest'

  root to: 'pages#root'
  get 'entreprise', to: 'pages#enterprise', as: :enterprise
  scope 'entreprise', as: :enterprise do
    get 'home', to: 'pages#enterprise_home'
    get 'pro', to: 'pages#enterprise_pro'
  end
  get 'legal', to: 'pages#legal'

  resources :business_requests, only: [ :create ]
  resources :commute_requests, only: [ :create ]
  resources :pro_requests, only: [ :create ]
end
