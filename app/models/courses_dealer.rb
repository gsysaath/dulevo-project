class CoursesDealer < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :courses_participants
end
