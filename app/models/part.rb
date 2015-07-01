class Part < ActiveRecord::Base
	has_many :oemfitments
	has_many :vehicles, through: :oemfitments
  belongs_to :user
  has_many :steps
  has_many :discoveries
  accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :vehicles, :reject_if => :all_blank, :allow_destroy => true
  validates :user_id, :manufacturer, :description, presence: true
end
