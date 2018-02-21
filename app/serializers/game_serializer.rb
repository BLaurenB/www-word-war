class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores


  def game_id
    :id
    binding.pry
  end

  def scores
    [{"user_id": get_scores.keys.first, "score": get_scores.keys.first.values},
      {"user_id": get_scores.keys.last, "score": get_scores.keys.first.last}]
  end

  def get_scores
    Game.find(id).scores
  end


end
