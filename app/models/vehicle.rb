class Vehicle < ActiveRecord::Base
	before_save :downcase_fields_and_upcase
    validates :make, :model, presence: true
    validates :year, presence: true, numericality: true, :inclusion => { in: 1900..Date.today.year+1, message: "needs to be between 1900-#{Date.today.year+1}"}
    
    private
        
        def downcase_fields_and_upcase
          self.make = make.downcase.capitalize
          self.model = model.upcase
        end
end
