class PlaysController < ApplicationController

  def create

    if params[:word].is_valid?
        Play.create(user)game_id, user_id, word
        # maybe if user_id is eve, it's player_2?

    redirect_to root_path
    else
      flash[:notice] = "Oh no! That wasn't a word!"
      redirect to root_path
    end

end
