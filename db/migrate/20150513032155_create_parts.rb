class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :manufacturer
      t.string :name
      t.string :description
      t.string :part_number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
