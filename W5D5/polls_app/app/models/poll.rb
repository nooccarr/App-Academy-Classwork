#   create_table "polls", force: :cascade do |t|
#     t.string "title", null: false
#     t.integer "author_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

class Poll < ApplicationRecord

    belongs_to :author,
        class_name: :user,
        primary_key: :id,
        foreign_key: :author_id

    has_many :questions,
        class_name: :question,
        primary_key: :id,
        foreign_key: :poll_id




end