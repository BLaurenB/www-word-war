class PlaysController < ApplicationController



  def create





    submitted_word = params[:word]


        Play.create(game_id: 1, user_id: 1, word: params[:word])
        # maybe if user_id is eve, it's player_2?
    redirect_to root_path
    else
      flash[:notice] = "Oh no! That wasn't a word!"
      redirect to root_path
    end
  end

end
