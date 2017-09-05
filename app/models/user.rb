class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: {minimum: 4}
  before_create :passwordcheck
  before_save { self.email = email.downcase}
  before_save { self.email = self.email.strip unless self.email.nil? }


  has_secure_password
  has_many :reviews
  def passwordcheck
    self.password_confirmation == self.password
  end

  def self.authenticate_with_credentials(email,password)
    myemail = email.delete(' ')
    myemail = myemail.downcase
    # FINDS a user with that email, then make sure that the password matches.
    user = User.find_by(email: myemail)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
