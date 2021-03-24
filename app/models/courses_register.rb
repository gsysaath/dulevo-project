class CoursesRegister < ApplicationRecord
  belongs_to :courses_participant
  belongs_to :course
end
