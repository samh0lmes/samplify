class GenresController < ApplicationController
  def index
    categories = RSpotify::Category.list
    @genres = {}
    categories.each do |category|
      @genres[category.name] = category.icons.first["url"]
    end
  end
end
