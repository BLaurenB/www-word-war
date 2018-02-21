class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores, :



  def game_id
    id
  end

  def scores
    "user_id": get_scores[key.first], 
  end

  def get_scores
    joins(:plays).group("plays.user_id").order("sum_score DESC").sum(:score)
  end
end
