class UsersController < ApplicationController
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    binding.pry
    render :show, locals: {user: spotify_user}
  end
end
