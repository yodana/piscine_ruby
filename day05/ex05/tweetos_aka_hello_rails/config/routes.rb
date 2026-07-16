Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :cuicuis
  resources :comments
  resources :likes
  # Defines the root path route ("/")
  # root "articles#index"
  root 'cuicuis#index' 
end
