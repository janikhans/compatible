class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :content
      t.references :part, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
