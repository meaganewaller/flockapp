class Speaker < ActiveRecord::Base
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_format_of :slides, :with => URI::regexp(%w(http https)), :allow_blank => true
  has_one :user


  def self.new_but_blank!
    speaker = new
    speaker.save(validate:false)
    speaker
  end
end
