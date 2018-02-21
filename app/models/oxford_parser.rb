class OxfordParser
attr_reader :word, :validated_word

  def initialize(word, validation)
    @word = word
    # binding.pry
    @validated_word = validation

    if @validated_word == "bad input"
      @validated_word
    else
      @validated_word = validation[:results].first[:lexicalEntries][1][:inflectionOf][0][:text]
    end
  end


  def self.validation(word)
    OxfordParser.new(word, call_oxford(word).parsed_response)
  end

  def self.call_oxford(word)
    OxfordService.new(word)
  end

end
