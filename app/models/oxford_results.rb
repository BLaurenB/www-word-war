class OxfordResults
  attr_reader :id, :language, :lexical_entries, :word

  def initialize(results_hash)
    @id = results_hash[:id]
    @language = results_hash[:language]
    @lexical_entries = LexicalEntries.new(results_hash[:lexicalEntries].first)
    @word = results_hash[:word]
  end

end
# results_hash = 
# {:id=>"at",
#  :language=>"en",
#  :lexicalEntries=>
#   [{:inflectionOf=>[{:id=>"at", :text=>"At"}, {:id=>"at", :text=>"at"}],
#     :language=>"en",
#     :lexicalCategory=>"Preposition",
#     :text=>"at"},
#    {:inflectionOf=>[{:id=>"at", :text=>"At"}, {:id=>"at", :text=>"at"}],
#     :language=>"en",
#     :lexicalCategory=>"Other",
#     :text=>"At"},
#    {:grammaticalFeatures=>[{:text=>"Singular", :type=>"Number"}],
#     :inflectionOf=>[{:id=>"at", :text=>"At"}, {:id=>"at", :text=>"at"}],
#     :language=>"en",
#     :lexicalCategory=>"Noun",
#     :text=>"at"}],
#  :word=>"at"}
