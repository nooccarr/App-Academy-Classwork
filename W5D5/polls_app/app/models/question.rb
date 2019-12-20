#   create_table "questions", force: :cascade do |t|
#     t.string "body", null: false
#     t.integer "poll_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.integer "answer_choice_id", null: false

class Question < ApplicationRecord


    belongs_to :answered_choices,
        class_name: :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id

    belongs_to :poll,
        class_name: :poll,
        primary_key: :id,
        foreign_key: :poll_id
end