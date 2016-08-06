Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/spotify/callback', to: 'users#spotify'
end
