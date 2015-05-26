Rails.application.routes.draw do
  resources :contests do
    resources :photos, only: [:edit, :update, :index]
    resources :votes, only: [:create, :new]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users

  root 'contests#index'


  resources :users, only: [:show]

  # in case the oauth provider doesn't provide a verified email address
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

end
