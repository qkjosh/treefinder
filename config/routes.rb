Rails.application.routes.draw do
  resources :parks, only: %i[index show]
  resources :genera, only: %i[index show]
  resources :families, only: %i[index show]

  resources :plants, only: %i[index show] do
    collection do
      get 'search'
    end
  end

  get 'about', to: 'pages#about'
  root to: 'pages#home'
end
