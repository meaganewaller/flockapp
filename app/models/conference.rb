class Conference < ActiveRecord::Base
  has_many :activities

  # These may no longer be needed if we are just going to use geocoding to show nearby ones
  has_many :airports
  has_many :hotels

  geocoded_by :location
  after_validation :geocode, :if => lambda { location_changed? && (latitude.blank? || longitude.blank?) }

  scope :between_dates, lambda { |date| where("start_date <= ? and end_date >= ?", date, date) }

  def nearby_airports(distance = 20)
    Airport.large_airports.near(location, distance)
  end

  def nearby_hotels(distance = 20)
    Hotel.near(location, distance)
  end

  def self.search(fields)
    case
      when fields[:name].present?      then where(["name like ?", "%#{fields[:name]}%"])
      when fields[:category].present?  then where(["category like ?", "%#{fields[:category]}%"])
      when fields[:childcare].present? then where({childcare: ActiveRecord::ConnectionAdapters::Column.value_to_boolean(fields[:childcare])})
      when fields[:location].present?  then near(fields[:location])
      when fields[:date].present?      then between_dates(fields[:date])
      else                                  all
    end
  end
end

