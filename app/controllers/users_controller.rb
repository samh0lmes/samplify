class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    sessions[:user] = spotify_user
    # playlist = spotify_user.create_playlist!('this-created-with-oauth')
    # tracks = RSpotify::Track.search('Video Games')
    # playlist.add_tracks!(tracks)
    # sessions[:recommendations] = RSpotify::Recommendations.generate(seed_genres: ['blues', 'country'])
    redirect_to 'genres/index'
  end
end
