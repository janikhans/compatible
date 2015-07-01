class CreateDiscoveries < ActiveRecord::Migration
  def change
    create_table :discoveries do |t|
      t.integer :part_id
      t.integer :oem_id
      t.integer :compatible_id
      t.integer :user_id
      t.text :comment
      t.boolean :modifications, :default => false

      t.timestamps null: false
    end
    add_index :discoveries, :user_id
    add_index :discoveries, :part_id
    add_index :discoveries, :compatible_id
  end
end
