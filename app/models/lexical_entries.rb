class LexicalEntries

  attr_reader :grammatical_features, :inflection_of, :language, :lexical_category, :text

  def initialize(lexical_entries_hash)
    @grammatical_features = lexical_entries_hash[:grammatical_features]
    @inflection_of = Inflection.new(lexical_entries_hash[:inflectionOf].first)
    @language = lexical_entries_hash[:language]
    @lexical_category = lexical_entries_hash[:lexical_category]
    @text = lexical_entries_hash[:text]
  end

end

#
# lexical_entries_hash =
# {:inflectionOf=>[{:id=>"at", :text=>"At"}, {:id=>"at", :text=>"at"}],
#  :language=>"en",
#  :lexicalCategory=>"Preposition",
#  :text=>"at"}
