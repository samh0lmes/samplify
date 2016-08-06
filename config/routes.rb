Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/spotify/callback', to: 'users#spotify'
  delete '/user', to: 'users#destroy'
end
