class Conference < ActiveRecord::Base
  has_many :activities
  has_many :airports
end
