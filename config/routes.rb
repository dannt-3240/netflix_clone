Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user, ->(u) { u.role == 'user' } do
    root to: 'home#index', as: :user_root
  end
  authenticated :user, ->(u) { u.role == 'admin' } do
    root to: 'admin/movies#new', as: :admin_root
  end
  root 'static_pages#home'
  resources :home, only: %i[index]
  resources :movies, only: %i[index show]
  resources :tv_series, only: %i[index show]
  resources :web_series, only: %i[index]
  resources :premium, only: %i[index]
  resources :contact, only: %i[index]
  # get '/users/sign_out' => 'devise/sessions#destroy'
  # get "/login", to: "users#login"
  # get "/signup", to: "users#signup"
  namespace :admin do
    get "/home", to: "static_pages#home"
    resources :movies, only: %i[new create index show]
    resources :tv_series, only: %i[new create index show]
  end
  get '/oauth2callback', to: 'sessions#set_google_drive_token'
end
