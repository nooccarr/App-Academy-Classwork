# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

user1 = User.create!(username: 'Rich')
user2 = User.create!(username: 'Dave')
user3 = User.create!(username: 'Oliver')
user4 = User.create!(username: 'Jon')
user5 = User.create!(username: 'Alex')
user6 = User.create!(username: 'Cindy')
user7 = User.create!(username: 'Josh')

art1 = Artwork.create!(title: 'Color', image_url: 'asdaswwe.com', artist_id: 1)
art2 = Artwork.create!(title: 'Color', image_url: 'qwdwqwq.com', artist_id: 3)
art3 = Artwork.create!(title: 'Sky', image_url: 'qwdwqwq.com', artist_id: 1)
art4 = Artwork.create!(title: 'Sea', image_url: 'qwdwqwq.com', artist_id: 2)

share1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
share2 = ArtworkShare.create!(artwork_id: 1, viewer_id: 4)
share3 = ArtworkShare.create!(artwork_id: 1, viewer_id: 5)
share4 = ArtworkShare.create!(artwork_id: 1, viewer_id: 6)
share5 = ArtworkShare.create!(artwork_id: 2, viewer_id: 3)
share6 = ArtworkShare.create!(artwork_id: 2, viewer_id: 4)
share7 = ArtworkShare.create!(artwork_id: 2, viewer_id: 5)
share8 = ArtworkShare.create!(artwork_id: 3, viewer_id: 6)
share8 = ArtworkShare.create!(artwork_id: 4, viewer_id: 7)

c1 = Comment.create!(body: 'This is amazing!', author_id: 3, artwork_id: 1)
c2 = Comment.create!(body: 'Absolutely stunning', author_id: 1, artwork_id: 4)
c3 = Comment.create!(body: 'It is like real life', author_id: 1, artwork_id: 2)
