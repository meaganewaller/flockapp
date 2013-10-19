class AddLatituteLongitudeToConference < ActiveRecord::Migration
  def change
    add_column :conferences, :latitude, :float
    add_column :conferences, :longitude, :float
    Conference.all.each do |conference|
      conference.geocode
      conference.save
    end
  end
end
