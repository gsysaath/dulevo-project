class CoursesParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :courses_dealer
  belongs_to :course
  belongs_to :courses_area_manager
  has_many :courses_registers

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
