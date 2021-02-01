class AddCertificationToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :certified, :boolean, default: false
  end
end
