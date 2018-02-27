require 'rails_helper'

describe "Game API" do
  describe "When I send a GET request to '/api/v1/games/1' with a valid word" do
    it "I receive a JSON response" do

      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)
      # binding.pry

      get "/api/v1/games/#{game.id}"

      expect(status).to eq(200)

      parsed_response = JSON.parse(response.body)

      expected_hash = {"game_id": game.id,
                        "scores": [
                        {"user_id":1, "score":15},
                        {"user_id":2,"score":16}
                        ]
                      }

      expect(expected_hash).to eq(parsed_response)
    end
  end

  describe "When I send a POST request to '/api/v1/games/1/plays' with valid word" do
    it "I receive a 200 Created Response" do

      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)


      post "/api/v1/games/#{Game.last.id}/plays", params: {user_id: 1, word: "at", game_id: 1}
      expect(status).to eq(204)

      get "/api/v1/games/#{Game.last.id}"
      parsed_response = JSON.parse(response.body)
      expected_hash = {
        "game_id": Game.last.id,
        "scores": [
          {
            "user_id":1,
            "score":17
          },
          {
            "user_id":2,
            "score":16
          }
        ]
      }
      expect(expected_hash).to eq(parsed_response)

    end
  end

  describe "When I send a POST request to '/api/v1/games/1/plays' with invalid word" do
    it "I receive a message that foxex is not a valid word" do

      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)


      post "/api/v1/games/#{Game.last.id}/plays", params: {user_id: 1, word: "foxez", game_id: 1}
      parsed_response = JSON.parse(response.body)
      expected_hash = {"message"=>"FAIL. foxez is not a valid word."}
      expect(expected_hash).to eq(parsed_response)

    end
  end



end
