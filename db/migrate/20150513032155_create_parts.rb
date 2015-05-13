class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.boolean :modifications
      t.text :comment
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
