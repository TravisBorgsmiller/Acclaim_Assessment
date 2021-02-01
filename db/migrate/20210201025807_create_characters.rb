class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :email
      t.string :badge_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
