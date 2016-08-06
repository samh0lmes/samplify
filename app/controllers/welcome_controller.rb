class WelcomeController < ApplicationController

  def index
    RSpotify::Category.list
    binding.pry
  end

end
