class Play < ApplicationRecord
  belongs_to :user
  belongs_to :game

  before_save :score_word

  def letter_scores
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
      "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10
    }
  end

  private

    def score_word
      if sanitize == false
        return 0
      else
        self.score  = word.rstrip.lstrip.upcase.split("").map do |letter|
          letter_scores[letter]
        end.sum
      end
    end


    def sanitize
      word.force_encoding("UTF-8").ascii_only?  #returns t/f. Do a flash from controller if score is 0?
      # || word is not an Oxford Approved word
    end

end
