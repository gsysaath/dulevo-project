class CreateCoursesDealers < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_dealers, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Courses Dealers" do |t|
      t.integer :mail_count, null: false, default: 0, comment: "0 = no mail, count mail sending"
      t.string :participate, default: 'N', limit: 1, comment: "Conferm participate : Y"
      t.date :date_participate, null: true, comment: "Registrazione date"
      t.references :user, null: false, foreign_key: true, default: 0, comment: "Dealers / Users with type = \'D\'"
      t.references :course, null: false, foreign_key: true, default: 0, comment: "Course ID"
    end
  end
end
