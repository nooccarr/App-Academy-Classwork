#   create_table "responses", force: :cascade do |t|
#     t.integer "creator_id", null: false
#     t.integer "question_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

class Response < ApplicationRecord
        belongs_to :answer_choice,
        class_name: :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id
        
        :respondent
        class_name: :
        primary_key: :id,
        foreign_key:
        

end
