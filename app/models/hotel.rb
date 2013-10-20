class Hotel < ActiveRecord::Base
  belongs_to :conference

  geocoded_by :location
  after_validation :geocode, :if => lambda { location_changed? && (latitude.blank? || longitude.blank?) }
end
