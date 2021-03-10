class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :title
      t.text :description
      t.references :tutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
