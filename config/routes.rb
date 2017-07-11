Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todolists#index"

  resources :todolists do
  	resources :todoitems
  end
  resources :sessions, only: [:new, :create, :destroy]

  get "/login" => "sessions#new", as: "login"
	delete "/logout" => "sessions#destroy", as: "logout"
  
end