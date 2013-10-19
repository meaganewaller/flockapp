class Conference < ActiveRecord::Base
  has_many :activities
  has_many :airports
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
end
