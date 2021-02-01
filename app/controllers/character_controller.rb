class CharacterController < ApplicationController

  def show
    service = CharacterService.new
    @character = service.get_character_data
  end

  def create
    
  end

end
