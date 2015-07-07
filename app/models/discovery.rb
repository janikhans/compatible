class Discovery < ActiveRecord::Base
	belongs_to :user
	belongs_to :part
	belongs_to :oem, class_name: "Vehicle"
	belongs_to :compatible, class_name: "Vehicle"
	has_many :steps
	accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true
	validates :user_id, :part_id, :oem_id, :compatible_id, :replaces, presence: true
end
