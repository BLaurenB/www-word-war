  class Inflection
    attr_reader :id, :text #!*!*!*! THIS TEXT IS THE ONE WE WANT TO SEND BACK as the root!!!

    def initialize(inflection_hash)
      @id = inflection_hash[:id]
      @text = inflection_hash[:text]
    end

  end

# inflection_hash = 
# {:id=>"at", :text=>"At"}
