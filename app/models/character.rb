class Character < ApplicationRecord
  validates_presence_of :email, :picture, :first_name, :last_name

end
