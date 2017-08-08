Rails.application.routes.draw do
  root to: 'pages#home'
  get 'legal', to: 'pages#legal'
end
