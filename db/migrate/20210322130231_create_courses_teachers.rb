class CreateCoursesTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_teachers, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Courses Teachers" do |t|
      t.string :participate, default: 'N', limit: 1, comment: "Conferm participate : Y"
      t.references :user, null: false, foreign_key: true, default: 0, comment: "Teachers / Users with type = \'T\'"
      t.references :course, null: false, foreign_key: true, default: 0, comment: "Course ID"
    end
  end
end
