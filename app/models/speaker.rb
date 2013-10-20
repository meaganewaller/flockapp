class Speaker < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_format_of :slides, :with => URI::regexp(%w(http https)), :allow_blank => true
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
