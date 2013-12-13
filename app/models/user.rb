class User < ActiveRecord::Base
  attr_accessible :email, :password

  before_validation :ensure_session_token
  validates :email, :password_digest, :presence => true
  validates :email, :uniqueness => true

  def self.find_by_credentials(email, secret)
    @user = User.find_by_email(email)
    if !!@user && @user.is_password?(secret)
      return @user
    else
      raise "Invalid login information"
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(secret)
    BCrypt::Password.new(secret) == BCrypt::Password.new(self.password_digest)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token!
    self.save!
  end

  private

  def ensure_session_token
    self.session_token || self.reset_session_token!
  end

  def password=(secret)
    self.password_digest = BCrypt::Password.create(secret)
  end

end