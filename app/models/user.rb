class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: {case_sensitive: true}

  validates :name, :email, presence: true

  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials (email, password)
    user = User.where(['email = ?', email.strip.downcase]).first

    if user && user.authenticate(password.strip)
      return user
    else 
      return nil
    end
  end


end
