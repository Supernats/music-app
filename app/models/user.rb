class User < ActiveRecord::Base
  attr_accessible :email, :password

  before_validation :ensure_session_token
  validates :email, :password_digest, :presence => true
  validates :email, :uniqueness => true

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token!
    self.save!
  end

  private

  def ensure_session_token
    self.session_token || self.reset_session_token!
  end

end