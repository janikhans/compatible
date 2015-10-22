require 'csv'

namespace :csv do

  desc "Import Vehicle CSV Data"
  task :seed_vehicles => :environment do
    Vehicle.delete_all
    csv_file_path = 'db/vehicles.csv'

    CSV.foreach(csv_file_path) do |row|
      Vehicle.create!({
        :year => row[0],
        :make => row[1],
        :model => row[2],        
      })
      puts "Row added!"
    end
  end
end