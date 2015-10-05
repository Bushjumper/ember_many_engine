Rails.application.routes.draw do
  resources :people
  resources :tasks
  resources :streams
  resources :books
end
