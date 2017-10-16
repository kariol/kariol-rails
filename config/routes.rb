Rails.application.routes.draw do
  require 'sidekiq/web'
  # authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  # end

  mount ForestLiana::Engine => '/forest'

  root to: 'pages#home'
  get 'entreprise', to: 'pages#enterprise', as: :enterprise
  get 'daily', to: 'pages#daily'
  get 'business', to: 'pages#business'
  get 'legal', to: 'pages#legal'

  get 'jeu', to: redirect('https://docs.google.com/forms/d/e/1FAIpQLSeBQZHSxbjdnSOklHUd2ryeVewsK4t_MlI3_hUqeo--gbnKsQ/viewform?usp=pp_url&entry.1522435496')

  resources :business_requests, only: [ :create ]
  resources :commute_requests, only: [ :create ]
  resources :pro_requests, only: [ :create ]
end
