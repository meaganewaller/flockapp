class Hotel < ActiveRecord::Base
  belongs_to :conference

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
end
