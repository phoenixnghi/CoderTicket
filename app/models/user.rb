class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :my_events, class_name: 'Event', foreign_key: 'user_id'

  def self.from_omniauth(auth)
    user = where(email: auth.email).first_or_create do |user|
      user.name     = auth.info.name
      user.email    = auth.info.email
      user.password = SecureRandom.urlsafe_base64
    end
    user.save
    user
  end
end
