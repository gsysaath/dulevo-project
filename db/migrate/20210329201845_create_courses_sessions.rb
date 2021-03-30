class CreateCoursesSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_sessions, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Courses Sessions" do |t|
      t.datetime :start_time, null: true, comment: "Course start datetime"
      t.datetime :end_time, null: true, comment: "Course start datetime"
      t.references :course, null: false, foreign_key: true, default: 0, comment: "Course ID"
    end
  end
end
