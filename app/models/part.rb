class Part < ActiveRecord::Base
  belongs_to :user
  has_many :steps
  accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true
  validates :user_id, :name, :comment, presence: true
end
