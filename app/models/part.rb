class Part < ActiveRecord::Base
  belongs_to :user
  has_many :steps
  validates :user_id, presence: true
end
