class Part < ActiveRecord::Base
	has_many :oemfitments
	has_many :vehicles, through: :oemfitments
  belongs_to :user
  has_many :discoveries
  accepts_nested_attributes_for :vehicles, :reject_if => :all_blank, :allow_destroy => true
  validates :user_id, :manufacturer, :name, presence: true
	before_save :strip_fields
	before_validation :strip_fields


  private

  def strip_fields
  	self.name = name.strip.split.map(&:capitalize).join(' ')
    # self.description = description.strip.capitalize
    # self.part_number = part_number.strip
  	self.manufacturer = manufacturer.upcase.strip
  end
end
