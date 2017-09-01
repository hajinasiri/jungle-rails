class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  before_save { self.email = email.downcase }
  has_secure_password
  has_many :reviews
end
