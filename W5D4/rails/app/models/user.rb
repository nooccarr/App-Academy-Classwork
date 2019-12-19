# create_table "users", force: :cascade do |t|
#   t.string "name"                         table: enrolled students
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class User < ApplicationRecord
    has_many :enrollments,
        class_name: 'Enrollment',
        foreign_key: :student_id,
        primary_key: :id

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course
end
