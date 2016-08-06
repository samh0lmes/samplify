class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    session[:user] = spotify_user
    # playlist = spotify_user.create_playlist!('this-created-with-oauth')
    # tracks = RSpotify::Track.search('Video Games')
    # playlist.add_tracks!(tracks)
    redirect_to '/genres'
  end

  def destroy
    session.clear
    redirect_to :root
  end
end
