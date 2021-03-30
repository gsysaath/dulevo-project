class CreateCoursesParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_participants, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Courses Participants" do |t|
      t.integer :mail_count, null: false, default: 0, comment: "0 = no mail, count mail sending"
      t.string :participate, default: 'N', limit: 1, comment: "Conferm participate : Y"
      t.references :user, null: false, foreign_key: true, default: 0, comment: "Users with type \'C\', \'V\'"
      t.references :courses_dealer, null: false, foreign_key: true, default: 0, comment: "Course Dealer id"
      t.references :course, null: false, foreign_key: true, default: 0, comment: "Course id"
      t.references :courses_area_manager, null: false, foreign_key: true, default: 0, comment: "Course Area Manager id"
    end
  end
end
