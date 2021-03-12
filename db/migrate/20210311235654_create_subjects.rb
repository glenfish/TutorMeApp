class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.integer :time, null: false
      t.references :tutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
