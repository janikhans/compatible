class Vehicle < ActiveRecord::Base
	has_many :oemfitments
	has_many :parts, through: :oemfitments
	before_save :upcase_fields_and_strip
	before_validation :upcase_fields_and_strip
    validates :make, :model, presence: true
    validates :year, presence: true, numericality: true, :inclusion => { in: 1900..Date.today.year+1, message: "needs to be between 1900-#{Date.today.year+1}"}
    validates :year, uniqueness: {scope: [:make, :model], message: " already exists"}
    # validates_uniqueness_of :model, :scope => [:year, :make]
  has_many :discoveries, foreign_key: "oem_id"
  has_many :discoveries, foreign_key: "compatible_id"
    
    private
        
        def upcase_fields_and_strip
          self.make = make.upcase.strip
          self.model = model.upcase.strip
        end
end
