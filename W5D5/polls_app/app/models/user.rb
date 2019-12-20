# create_table "users", force: :cascade do |t|
#   t.string "username", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["username"], name: "index_users_on_username", unique: true
# end

class User < ApplicationRecord

    has_many :authored_polls,
        class_name: :poll,
        primary_key: :id,
        foreign_key: :author_id

    has_many :responses,
        class_name: :response,
        primary_key: :id,
        foreign_key: :creator_id


end