class Character
  attr_reader :name, :comics, :picture

  def initialize(name, comics, picture)
    @name = name
    @comics = comics
    @picture = picture
  end

end
