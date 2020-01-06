# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true 
  validates :session_token, presence: true, uniqueness: true 
  validates :password, length: {minimum: 6}, allow_nil: true

  attr_reader :password

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token! #generates new token, then save 
    self.session_token = User.generate_session_token
    self.save!
    session[:session_token] = self.session_token
  end

  def password=(password)       # sign up only!
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
    # setter method that writes the password_digest attribute with 
    # the hash of the given password
  end

  def is_password?(password) #we have to change password_digest to a bcrypt class then compare them 
    bcrypt_pass = BCrypt::Password.new(self.password_digest)
    bcrypt_pass.is_password?(password) #is_password? here is not the same method, its different
    #grab salt from bycrpt then add to password and then hash it thru bcrpyt:password
  end

  def self.find_by_credentials(user_name, password)

  end

  private 
  def ensure_session_token
    self.session_token ||= User.generate_session_token #make sure session_token is never blank
  end
end
