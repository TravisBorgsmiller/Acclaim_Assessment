class CharacterController < ApplicationController

  def show
    @candidate = CharacterService.new.get_character_data
    session[:current_candidate] = @candidate
  end

  def create
    new_character = Character.create(create_character)
    if new_character.save!
      flash[:success] = "#{new_character.last_name} has been recruited! Certify #{new_character.last_name} with a badge to make it offical!"
      redirect_to :root
    end
  end

  private

    def create_character
      {
        email: create_email + "@example.com",
        picture: session[:current_candidate]['picture'],
        first_name: "Recruit",
        last_name: session[:current_candidate]['name']
      }
    end

    def create_email
      a = session[:current_candidate]['name'].split('')
      b = []
      a.each do |s|
        if s == " "
          s = "_"
        end
        b << s
      end
      b.join
    end

end
