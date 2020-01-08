# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

# validates the email , password(minimum 6 charcters)
# allow nil for password **
#find by credentials
#generate session token
#reset session token!
#is password?
#password = 
#ensure_session_token 
#before validation runnign ensure session token
#attr reader for password.. 



    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }


    describe "::find_by_credential" do
        let(:harry) { create(:user) }
        context "finds matching email and password" do
            it "should return the user" do
                user = User.find_by_credentials(harry.email, 'oiwnfn1')
                              
                expect(harry.email).to eq(user.email)
                expect(harry.password_digest).to eq(user.password_digest)
            end
        end

        context "if it doesn't find matching email and password" do
            it "should return nil" do
            end
        end
    end

  describe "#reset_session_token!" do
    let(:harry) { create(:user) }
    it "should set a new session token should not equal the previous" do
      token = harry.session_token
      harry.reset_session_token!
      expect(harry.session_token).to_not eq(token)
    end
  end

  describe "#is_password" do
    let(:harry) { create(:user) }
    it "should check to see if the password entered is the correct password" do
      expect(harry.password).to eq("oiwnfn1")
    end

  end
end
