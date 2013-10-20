class Conference < ActiveRecord::Base
  has_many :activities
  paginates_per 10

  # These may no longer be needed if we are just going to use geocoding to show nearby ones
  has_many :airports
  has_many :hotels

  geocoded_by :location
  after_validation :geocode, :if => lambda { location_changed? && (latitude.blank? || longitude.blank?) }

  scope :on_date, lambda { |date| where("start_date <= ? and end_date >= ?", date, date) }

  scope :upcoming, lambda { where("start_date >= ?", Date.today) }

  validates :safety_policy, :format => { with: URI::regexp(%w(http https)), :message => "must be a URL to your policy" }, allow_blank: true

  def nearby_airports(distance = 20)
    Airport.large_airports.near(location, distance)
  end

  def nearby_hotels(distance = 20)
    Hotel.near(location, distance)
  end

  def self.search(fields)
    scopes = {
      name:          where(["name like ?", "%#{fields[:name]}%"]),
      category:      where(["category like ?", "%#{fields[:category]}%"]),
      childcare:     where({childcare: ActiveRecord::ConnectionAdapters::Column.value_to_boolean(fields[:childcare])}),
      safety_policy: where("safety_policy is not null and safety_policy <> ''"),
      location:      near(fields[:location]),
      date:          on_date(fields[:date]),
    }

    scopes.keys.inject(self.all) do |results, field|
      if fields[field].present? then
        results.merge(scopes.fetch(field))
      else
        results
      end
    end
  end
end

