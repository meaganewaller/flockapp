class AddLatitudeLongitudeToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :latitude, :float
    add_column :airports, :longitude, :float
    Airport.all.each do |airport|
      airport.geocode
      airport.save
    end
  end
end
