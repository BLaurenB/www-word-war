class WelcomeController < ApplicationController
  def index



      # ParserClass.classmethod(submitted word)
      connection = Faraday.new("https://od-api.oxforddictionaries.com") do |f|
        f.adapter Faraday.default_adapter
        f.headers['app_id'] = ENV['OXFORD_ID']
        f.headers['app_key'] = ENV['OXFORD_KEY']
      end

      response = connection.get("/api/v1/inflections/en/foxes")
# binding.pry

      @parsed_response = JSON.parse(response.body, symbolize_names: true)[:results][:lexicalEntries][1][:text]
      #need inflection_of:text

  end

end
