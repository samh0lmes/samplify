class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    session[:user] = spotify_user
    # playlist = spotify_user.create_playlist!('this-created-with-oauth')
    # tracks = RSpotify::Track.search('Video Games')
    # playlist.add_tracks!(tracks)
    recommendations = RSpotify::Recommendations.generate(seed_genres: ['blues', 'country'])
    render :show, locals: {user: spotify_user, playlists: spotify_user.playlists, recommendations: recommendations}
  end

  def destroy
    session.clear
    redirect_to :root
  end
end
