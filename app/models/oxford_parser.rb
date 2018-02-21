class OxfordParser
attr_reader :word, :validation

  def initialize(word, validation)
    @word = word
    @validated_word = validation[:results].first[:lexicalEntries][1][:inflectionOf][0][:text]
    if @validated_word != word
      return false
    else
      return @validated_word
    end
  end


  def self.validation(word)
    OxfordParser.new(call_oxford(word).parsed_response)
  end

  def self.call_oxford(word)
    OxfordService.new(word)
  end

end
