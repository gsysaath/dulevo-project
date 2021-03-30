class CreateCoursesAreaManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_area_managers, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Courses Area managers" do |t|
      t.string :participate, default: 'N', limit: 1, comment: "Conferm participate : Y"
      t.references :user, null: false, foreign_key: true, default: 0, comment: "Area managers / Users with type = \'A\'"
      t.references :course, null: false, foreign_key: true, default: 0, comment: "Course ID"
    end
  end
end
