class PlaysController < ApplicationController



  def create

    #
    # connection = Faraday.new("https://od-api.oxforddictionaries.com") do |f|
    #   f.adapter Faraday.default_adapter
    #   f.headers['app_id'] = ENV['OXFORD_ID']
    #   f.headers['app_key'] = ENV['OXFORD_KEY']
    # end
    #
    # response = connection.get("/api/v1/inflections/en/#{submitted_word}")
    #
    # parsed_response = JSON.parse(response.body, symbolize_names: true)[:results].first[:lexicalEntries][1][:inflectionOf][0][:text]

    # submitted_word = params[:word]

    parsed_response = OxfordParser.validation(params[:word]).validated_word

    if parsed_response != "bad input"
      Play.create(game_id: 1, user_id: 1, word: params[:word])
      # maybe if user_id is eve, it's player_2?
      flash[:notice] = "SUCCESS! #{params[:word]} is a valid word and its root form is #{parsed_response}."
      redirect_to root_path
    else
      flash[:notice] = "Oh no! That wasn't a valid word!"
      redirect_to root_path
    end
  end

end
