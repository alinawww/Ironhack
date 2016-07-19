Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to:'contacts#index'
  get '/new', to:'contacts#new'
  post '/contacts', to: 'contacts#create'
  get '/contacts', to: 'contacts#index'
  get '/details/:id', to: 'contacts#showDetails'
  post '/favorites', to: 'contacts#createFavorite'
  get '/favorites', to: 'contacts#showFavorites'

  get '/search', to: 'contacts#showSearch'
  get '/it-s-a-wizard', to: 'contacts#showWizard'
  # get '/search', to: 'contacts#showSearch'
end
