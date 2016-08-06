class SongsController < ApplicationController
  def create
  end

  def show
    spotify_user = RSpotify::User.new(session[:user])
    playlist = spotify_user.playlists.find {|playlist| playlist.name == "our-app-#{params[:genre]}"}
    playlist = spotify_user.create_playlist!("our-app-#{params[:genre]}") unless playlist
  end

  def destroy
  end
end
