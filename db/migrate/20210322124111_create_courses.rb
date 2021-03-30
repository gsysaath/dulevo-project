class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Corso/Courses" do |t|
      t.string :name, null: false, default: "", limit: 50, comment: "Course Name"
      t.string :description, null: false, default: "", comment: "Course Description"
      t.string :language, null: false, default: "", limit: 2, comment: "Language"
      t.integer :status, null: false, default: 0, comment: "-1 = Annullato\r\n0 = New\r\n\r\n2 = Pubblicato\r\n3 = Eseguito"
      t.text :note
      t.boolean :online, null: false, default: false, comment: "True or False if course if online"
      t.string :link, null: false, default: '', comment: "Link of the online class"
      t.string :close, null: false, default: "N", limit: 1, comment: "Course is finished = \'Y\'"
      t.integer :max_register,default: 0, comment: "Max count register"
      t.references :courses_type, null: true, comment: "Course Type"
      t.references :location, null: true, comment: "Course Location"
    end
  end
end
