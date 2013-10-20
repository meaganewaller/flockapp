class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#   attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :speaker

  def is_speaker
    !!speaker
  end

  def is_speaker=(b)
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(b)
      self.speaker = Speaker.new_but_blank!
    end
  end


end
