Rails.application.routes.draw do
  devise_for :users, controllers: {
        sign_in: 'login',
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'posts#index'
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  resources :posts
end
