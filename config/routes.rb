Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/spotify/callback', to: 'users#spotify'
  delete '/user', to: 'users#destroy'
  resources :genres, only: [:index]
  get '/songs', to: 'songs#show', as: 'song'
  get '/songs/new', to: 'songs#create', as: 'create_song'
  get '/song', to: 'songs#destroy', as: 'delete_song'
end
