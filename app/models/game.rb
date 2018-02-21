class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id



  has_many :plays

  def get_scores
    joins(:plays).group("plays.user_id").order("sum_score DESC").sum(:score)
  end

end
