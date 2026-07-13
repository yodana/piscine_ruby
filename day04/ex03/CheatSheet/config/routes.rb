Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root 'pages#convention'
  
  get 'console', to: 'pages#console'
  get 'ruby', to: 'pages#ruby'
  get 'ruby/concepts', to: 'pages#ruby_concepts'
  get 'ruby/numbers', to: 'pages#ruby_numbers'
  get 'ruby/strings', to: 'pages#ruby_strings'
  get 'ruby/arrays', to: 'pages#ruby_arrays'
  get 'ruby/hashes', to: 'pages#ruby_hashes'
  get 'rails/folder-structure', to: 'pages#rails_folder_structure'
  get 'rails/commands', to: 'pages#rails_commands'
  get 'rails/erb', to: 'pages#rails_erb'
  get 'editor', to: 'pages#editor'
  get 'help', to: 'pages#help'
  get 'quick-search', to: 'pages#quick_search'
  get 'log-book', to: 'logbook#log_book'
  post 'log-book/write', to: 'logbook#write'
end
