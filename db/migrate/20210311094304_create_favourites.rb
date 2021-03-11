class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.references :student, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
