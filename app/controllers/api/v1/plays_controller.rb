class Api::V1::PlaysController < ActionController::API

  def show
    render json: Play.find(params[:id])
  end

  def create
    parsed_response = OxfordParser.validation(params[:word]).validated_word.lexical_entries.inflection_of.text
    binding.pry

    if parsed_response != "bad input"
      Play.create(play_params)
    else
      render json: {message: "FAIL. #{params[:word]} is not a valid word."}
    end
  end

  private
    def play_params
      params.permit(:user_id, :game_id, :word)
    end

end
