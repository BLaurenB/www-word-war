class OxfordService

  attr_reader :word

  def initialize(word)
    @word = word
  end


  def connection
    Faraday.new("https://od-api.oxforddictionaries.com") do |f|
      f.adapter Faraday.default_adapter
      f.headers['app_id'] = ENV['OXFORD_ID']
      f.headers['app_key'] = ENV['OXFORD_KEY']
    end
  end


  def parsed_response
    response = connection.get("/api/v1/inflections/en/#{word}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
