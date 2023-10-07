Rails.application.routes.draw do
  resources :users
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/search' => 'users#index', as: :search
  # Defines the root path route ("/")
  # root "articles#index"
end
