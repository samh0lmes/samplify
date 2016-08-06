class SongsController < ApplicationController
  def create
  end

  def show
    session[:tracks] = []
    spotify_user = RSpotify::User.new(session[:user])
    existing_playlist = spotify_user.playlists.find {|playlist| playlist.name == "our-app-#{params[:genre]}"}
    @playlist = spotify_user.create_playlist!("our-app-#{params[:genre]}") unless existing_playlist
    category = RSpotify::Category.find("#{params[:genre].downcase.tr(" ", "")}")
    playlists = category.playlists
    tracks = []
    i = 0
    playlists.shuffle.each do |playlist|
      playlist.tracks.shuffle.each do |track|
        next unless track.preview_url
        break if i >= 40
        tracks[i] = {name: track.name, preview: track.preview_url, artist: track.artists.first.name}
        i += 1
      end
    end
    # session[:songs] = RSpotify::Recommendations.generate(seed_genres: ['blues', 'country'])
    # session[:songs] = RSpotify::Recommendations.generate(seed_genres: ["#{params[:genre]}"])
    # session[:tracks] = tracks.uniq!
    @track = tracks.shuffle.first
  end

  def destroy
  end
end
