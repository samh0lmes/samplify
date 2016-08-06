module SongsHelper
  def set_genre(genre)
    case genre
    when "Folk & Americana"
      return "folk_americana"
    when "Indie"
      return "indie_alt"
    when "Trending"
      return "popculture"
    when "EDM/Dance"
      return "edm_dance"
    else
      return genre.downcase.tr(" ", "")
    end
  end
end
