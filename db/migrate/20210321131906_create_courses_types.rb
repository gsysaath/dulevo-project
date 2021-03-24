class CreateCoursesTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_types, id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Tipo di ruolo / Types roles" do |t|
      t.bigint :id, null: false, unique: true, auto_increment: true, primary_key: true, comment: "Course Register ID"
      t.mediumtext :note
    end
  end
end
