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

FactoryBot.define do
  # factory :user do
  #   email { Faker::Internet.email }
  #   password_digest { "password" }
  #   session_token { "sessiontoken12389" }
  # end

  factory :user do
    email { Faker::Internet.email }
    password { "oiwnfn1" }
    session_token { "sessiontoken12389" }
  end

end
