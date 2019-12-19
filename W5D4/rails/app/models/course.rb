# create_table "courses", force: :cascade do |t|
#   t.string "name"                         # table: enrolled courses
#   t.integer "prereq_id"
#   t.integer "instructor_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end


class Course < ApplicationRecord
  has_many :enrollments,
    class_name: 'Enrollment',
    foreign_key: :course_id,
    primary_key: :id

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :prerequisite,
    class_name: 'Course',
    foreign_key: :prereq_id,
    primary_key: :id

   belongs_to :instructor,
    class_name: 'User',
    foreign_key: :instructor_id,
    primary_key: :id

end
