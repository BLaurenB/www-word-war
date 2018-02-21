class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores


  def game_id
    id
  end

  def scores
    [{"user_id": get_scores.keys.first, "score": get_scores.keys.first.values},
      {"user_id": get_scores.keys.last, "score": get_scores.keys.first.last}]
  end

  def get_scores
    joins(:plays).group("plays.user_id").order("sum_score DESC").sum(:score)
  end


end
