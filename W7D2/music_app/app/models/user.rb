# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :email, :password_digest, :session_token, presence: true
    validates :email, :session_token, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    attr_reader :password

    after_initialize :ensure_session_token  # set session token before validation

    # .create creates a Password object by hashing the input, while 
    # .new builds a Password object from an existing, string-ified hash.
    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return user if user && is_password?(password)
        nil
    end

    def self.generate_session_token         # session token method
        SecureRandom.urlsafe_base64(16)     # memorize!
    end

    def reset_session_token!                # session token method
        self.session_token = User.generate_session_token
        self.save!
        self.session_token 
    end

    def ensure_session_token                # session token method
        self.session_token ||= User.generate_session_token
    end                      # self.user.generate_session_token

    def password=(password)                 # issues a password
        @password = password       # creates password attribute??(why)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)              # checks password
        BCrypt::Password.new(self.password_digest).is_password?(password)    
    end


end

# F - find_by_credentials - searches db for user by email/username and checks if given password is a match (using is_password? method)
# I - is_password? - this takes in a plain text password and calls the is_password? method on a BCrypt.new object using the user.password_digest
# G - generate_session_token - uses the SecureRandom.urlsafe_base64(16) method to generate a session token
# V - validations, checks presence of username, password (length, allow_nil, etc.)
# A - after_initialize - after initializing an instance of our user class, we want to ensure that the user has a session_token (call the ensure_session_token method)
# P - password= - takes in a plain text password, sets the @password ivar and sets self.password_digest to Bcrypt.create(password)
# E - ensure_session_token - user.session_token ||= user.class.generate_session_token
# R - reset_session_token - set user.session_token to user.class.generate_session_token, saves the user to the database and returns the new session_token





