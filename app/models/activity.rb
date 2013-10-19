class Activity < ActiveRecord::Base
  belongs_to :conference

  scope :alcohol_free, -> { where(alcohol: false) }
end
