Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#home'
  resources :home, only: %i[index]
  resources :movies, only: %i[index show]
  resources :web_series, only: %i[index]
  resources :premium, only: %i[index]
  resources :contact, only: %i[index]
  get "/login", to: "users#login"
  get "/signup", to: "users#signup"
end
