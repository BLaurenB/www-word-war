require 'rails_helper'

feature "Game API" do

  describe "When I send a GET request to “/api/v1/games/1”" do
    it "I receive a JSON response" do

      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      get "api/v1/games/1"

      expect(status).to be_success

      parsed_response = JSON.parse(repsonse.body, symbolize_names: true)
      binding.pry

    end
  end

end




```{
  "game_id":1,
  "scores": [
    {
      "user_id":1,
      "score":15
    },
    {
      "user_id":2,
      "score":16
    }
  ]
}```
