class Course < ApplicationRecord
  belongs_to :courses_type
  belongs_to :location
  has_many :courses_teachers, dependent: :destroy
  has_many :courses_dealers, dependent: :destroy
  has_many :courses_participants, dependent: :destroy
  has_many :courses_registers, dependent: :destroy
  has_many :courses_area_managers, dependent: :destroy
  has_many :courses_sessions, dependent: :destroy

  
end
