class GenresController < ApplicationController

  def index
  end

  def show
  end

end

# home page: background of music
# floating div with "sign in with spotify"

# redirect to genre index page
# user picks a genre,
  # redirect to genre show page (the song previews)
    # find or create playlist "our-app-genre"
    # genre show controller gets recommendations
    # show view page plays first song
    # <VIEW PAGE>
      # top has genre name
      # centered song preview
      # buttons underneath
    # user hits "no" or "yes"
      # if no, next song is previewed
      # if yes, add song to our-app-genre playlist
        # next song is previewed
    # back to genres button
      # redirect to genre index page
# 'logout' button that destroys the session
  # redirects to root
