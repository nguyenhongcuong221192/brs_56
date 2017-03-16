Rails.application.routes.draw do
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#help"
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :books do
      collection { post :import }
    end
  end
end
