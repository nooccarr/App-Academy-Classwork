#   create_table "answer_choices", force: :cascade do |t|
#     t.string "body", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

class AnswerChoice < ApplicationRecord  

    has_many :question,
    class_name: :question,
    primary_key: :id,
    foreign_key: :answer_choice_id
    
    has_many :responses
    class_name: :response,
    primary_key: :id,
    foreign_key: :answer_choice_id
end