class CoursesTeacher < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
end
