Rails.application.routes.draw do
  resources :users
  get 'users/new'
  post 'users/create'
  get 'users/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
