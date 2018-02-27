class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [{"user_id": get_scores.keys.first, "score": get_scores.values.first},
      {"user_id": get_scores.keys.last, "score": get_scores.values.last}]
  end

  def get_scores
    object.plays.group("plays.user_id").order("user_id").sum(:score)
  end


end
