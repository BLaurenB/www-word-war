class PlaysController < ApplicationController



  def create

    parsed_response = OxfordParser.validation(params[:word]).validated_word.lexical_entries.inflection_of.text
    # binding.pry

    if parsed_response != "bad input"
      # Play.create(game_id: 1, user_id: 1, word: params[:word])
      # maybe if user_id is even, it's player_2?
      flash[:notice] = "SUCCESS! #{params[:word]} is a valid word and its root form is #{parsed_response}."
      redirect_to root_path
    else
      flash[:notice] = "FAIL. #{params[:word]} is not a valid word."
      redirect_to root_path
    end
  end

end
