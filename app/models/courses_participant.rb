class CoursesParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :courses_dealer
  belongs_to :course
  has_many :courses_registers
end
