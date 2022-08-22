Rails.application.routes.draw do

  post 'register_contact', to: 'contacts#create'
  post '/auth/login', to: 'authentication#login'
  post '/users', to: 'users#create'

  get 'contacts', to: 'contacts#get'
  get 'consult_cep', to: 'cep#get'

  get '/*a', to: 'application#not_found'


end
