class AddReplacestoDiscoveries < ActiveRecord::Migration
  def change
  	add_column :discoveries, :replaces, :string
  end
end
