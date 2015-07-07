class Oemfitment < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :part
	belongs_to :user
	validates :part_id, :vehicle_id, :user_id, presence: true
    validates :vehicle_id, uniqueness: {scope: [:part_id], message: " already exists"}
end
