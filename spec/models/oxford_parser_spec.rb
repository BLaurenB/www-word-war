require 'rails_helper'

describe OxfordParser do
  context "Class methods" do


    context ".validation" do

      it "calls the Service" do
        parser = OxfordParser.validation("foxes")
        # binding.pry
        expect(parser.validated_word.lexical_entries.inflection_of.text).to eq()
      end
    end

    context ".call_service" do

      it "calls the Service" do
        parser = OxfordParser.call_oxford("foxes")

      end
    end


  end
end
