class OxfordParser
attr_reader :word, :validated_word

  def initialize(word, validation)
    @word = word
    @validated_word = validation

    if @validated_word == "bad input"
      @validated_word
    else
      @validated_word = OxfordResults.new(validation[:results].first)
      

    end
  end


  def self.validation(word)
    OxfordParser.new(word, call_oxford(word).parsed_response)
  end

  def self.call_oxford(word)
    OxfordService.new(word)
  end

end
#
# {
#   :metadata=>{:provider=>"Oxford University Press"},
#
#   :results=>
#   [{
#     :id=>"foxes",
#
#     :language=>"en",
#
#     :lexicalEntries=>
#      [{
#        :grammaticalFeatures=>
#           [{:text=>"Third", :type=>"Person"}, {:text=>"Singular", :type=>"Number"}, {:text=>"Present", :type=>"Tense"}],
#        :inflectionOf=>[{:id=>"fox", :text=>"fox"}],
#        :language=>"en",
#        :lexicalCategory=>"Verb",
#        :text=>"foxes"},
#       {
#        :grammaticalFeatures=>[{:text=>"Plural", :type=>"Number"}],
#        :inflectionOf=>[{:id=>"fox", :text=>"fox"}],
#        :language=>"en",
#        :lexicalCategory=>"Noun",
#        :text=>"foxes"}],
#
#     :word=>"foxes"}]}
#
#     validation[:results].first[:lexicalEntries][1][:inflectionOf][0][:text]
#
#     class OxfordResults  attr_reader :id, :language, :lexical_entries, :word
#     class LexicalEntries (just create using the second set in the array? -- lexicalentries[1]
#                          attr_reader :grammatical_features, :inflection_of, :language, :lexical_category, :text
#     class Inflection attr_reader :id, :text !*!*!*! THIS TEXT IS THE ONE WE WANT TO SEND BACK as the root!!!
