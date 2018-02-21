class Api::V1::GamesController < ActionController::API

  def show
    render json: Game.find(params[:id])
  end

end


{
  "id": 1,
  "player_1_id": 1,
  "player_2_id": 2,
  "created_at": "2018-02-21T02:24:28.078Z",
  "updated_at": "2018-02-21T02:24:28.078Z"
}

{
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
}
