# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
    validates :title, :image_url, presence: :true
    validates :artist_id, presence: true
    validates :artist_id, uniqueness: { scope: :title }    

    belongs_to :artist,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :artist_id

    has_many :artwork_shares,
        class_name: :ArtworkShare,
        primary_key: :id,
        foreign_key: :artwork_id
    
    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer



end
