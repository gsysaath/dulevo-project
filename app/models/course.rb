class Course < ApplicationRecord
  belongs_to :courses_type
  belongs_to :location
  has_many :courses_teachers
  has_many :courses_dealers
  has_many :courses_participants
  has_many :courses_registers
end
