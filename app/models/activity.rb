class Activity < ActiveRecord::Base
  belongs_to :conference

  scope :alcohol_free, -> { where(alcohol: false) }
  scope :alcohol,      -> { where(alcohol: true) }
end
