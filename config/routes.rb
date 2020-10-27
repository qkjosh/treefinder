Rails.application.routes.draw do
  resources :parks, only: %i[index show]
  resources :plants, only: %i[index show]

  get 'about', to: 'pages#about'
  root to: 'pages#home'
end
