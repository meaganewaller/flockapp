class Conference < ActiveRecord::Base
  has_many :activities

  # These may no longer be needed if we are just going to use geocoding to show nearby ones
  has_many :airports
  has_many :hotels

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  def nearby_airports(distance = 20)
    Airport.near(location, distance)
  end

  def nearby_hotels(distance = 20)
    Hotel.near(location, distance)
  end
end

