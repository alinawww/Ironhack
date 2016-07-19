Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show, :new, :create] do
    resources :comments
  end
  resources :users
  # resources :search

  get '/search', to:'search#index'
  post '/search', to:'search#create'
  post '/login', to: 'logins#create'
  get '/users/:current_user_id', to: 'site#index'
  get '/search/show_search_result', to:'search#show_search_result'
  get '/search/show_imdb_result', to:'search#show_imdb_result'

end
