class Vehicle < ActiveRecord::Base
	has_many :oemfitments
	has_many :parts, through: :oemfitments
	before_save :upcase_fields
	before_validation :upcase_fields
    validates :make, :model, presence: true
    validates :year, presence: true, numericality: true, :inclusion => { in: 1900..Date.today.year+1, message: "needs to be between 1900-#{Date.today.year+1}"}
    validates :year, uniqueness: {scope: [:make, :model], message: " already exists"}
    # validates_uniqueness_of :model, :scope => [:year, :make]
    
    private
        
        def upcase_fields
          self.make = make.upcase
          self.model = model.upcase
        end
end
