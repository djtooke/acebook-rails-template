Rails.application.routes.draw do

  get '/',  to: 'posts#index'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#post'
  resources :posts
  resources :users
end

