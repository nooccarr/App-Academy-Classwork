# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    validates :body, :author_id, :artwork_id, presence: true
    
    belongs_to :author,
        class_name: :User,
        primary_key: :id,
        foreign_key: :author_id,
        dependent: :destroy

    belongs_to :artwork,
        class_name: :Artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        dependent: :destroy


end
