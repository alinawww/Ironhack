Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'product#index'


  get '/users/new', to: 'user#new'
  get '/users', to: 'user#show', as: 'users_path'
  post '/users', to: 'user#create'

  get '/products', to: 'product#index'
  get 'users/:user_id/products', to: 'product#show'
  get 'users/:user_id/products/new', to: 'product#new'
  post 'users/:user_id/products', to: 'product#create', as: :user_products

end
