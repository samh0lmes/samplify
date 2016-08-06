class SongsController < ApplicationController

  def create
    @tracks = params[:tracks].as_json
    @genre = params[:genre]
    track_id = @tracks.first["id"]
    track = RSpotify::Track.find("#{track_id}")
    @tracks.delete_at(0)
    user = RSpotify::User.new(session[:user])
    playlist = user.playlists.find {|playlist| playlist.name == "Samplify-#{@genre}"}
    playlist.add_tracks!([track])
    @track = @tracks.first
    @name = @track["name"]
    @preview = @track["preview"]
    @artist = @track["artist"]
    @id = @track["id"]
    @img = @track["img"]
    render :show
  end

  def show
    @genre = params[:genre]
    spotify_user = RSpotify::User.new(session[:user])
    existing_playlist = spotify_user.playlists.find {|playlist| playlist.name == "Samplify-#{@genre}"}
    @playlist = spotify_user.create_playlist!("Samplify-#{@genre}") unless existing_playlist
    category = RSpotify::Category.find("#{@genre.downcase.tr(" ", "")}")
    playlists = category.playlists
    @tracks = []
    i = 0
    playlists.shuffle.each do |playlist|
      playlist.tracks.shuffle.each do |track|
        next unless track.preview_url
        break if i >= 20
        @tracks[i] = { name: track.name,
                       preview: track.preview_url,
                       artist: track.artists.first.name,
                       id: track.id,
                       img: track.album.images.first["url"]
                    }
        i += 1
      end
    end
    @track = @tracks.shuffle.first
    @name = @track[:name]
    @preview = @track[:preview]
    @artist = @track[:artist]
    @id = @track[:id]
    @img = @track[:img]
  end

  def destroy
    @tracks = params[:tracks].as_json
    @genre = params[:genre]
    @tracks.delete_at(0)
    @track = @tracks.first
    @name = @track["name"]
    @preview = @track["preview"]
    @artist = @track["artist"]
    @id = @track["id"]
    @img = @track["img"]
    render :show
  end
end
