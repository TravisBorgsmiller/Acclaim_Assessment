class CharacterService

  # def get_forecast_data(coordinates)
  #   response = conn.get("onecall?") do |req|
  #     req.params['lat'] = coordinates[:lat]
  #     req.params['lon'] = coordinates[:lng]
  #     req.params['units'] = 'imperial'
  #   end
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def get_character_data
    response = conn.get do |req|
      req.params['limit'] = 1
      req.params['offset'] = rand(500)
    end
    character_info = JSON.parse(response.body, symbolize_names: true)
    name = character_info[:data][:results][0][:name]
    comics = character_info[:data][:results][0][:comics][:available]
    picture_path = character_info[:data][:results][0][:thumbnail][:path]
    picture_extension = character_info[:data][:results][0][:thumbnail][:extension]
    picture = picture_path + "." + picture_extension
    Character.new(name, comics, picture)
  end

  def conn
    Faraday.new('http://gateway.marvel.com/v1/public/characters') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['apikey'] = ENV['PUBLIC_MARVEL_KEY']
      faraday.params['ts'] = ENV['TS']
      faraday.params['hash'] = ENV['HASH']
    end
  end

end
