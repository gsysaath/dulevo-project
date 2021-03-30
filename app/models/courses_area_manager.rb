class CoursesAreaManager < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :courses_participants

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
