Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "register_user", to: "users#create"

  # Defines the root path route ("/")
  # root "articles#index"
end
