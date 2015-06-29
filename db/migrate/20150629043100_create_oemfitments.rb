class CreateOemfitments < ActiveRecord::Migration
  def change
    create_table :oemfitments do |t|
      t.integer :vehicle_id
      t.integer :part_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
