class Airport < ActiveRecord::Base
  has_and_belongs_to_many :conferences
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
end
