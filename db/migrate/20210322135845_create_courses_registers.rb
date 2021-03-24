class CreateCoursesRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_registers, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Courses Registers" do |t|
      t.string :people, null: false, default: '', comment: "Participant People"
      t.string :vote, null: false, default: '', limit: 1, comment: "Participant Vote\r\nY : graduate , N : rejected"
      t.mediumtext :rating, comment: "Participant Rating"
      t.string :email, null: true
      t.string :telephone, null: false, default: '', comment: "telephone number"
      t.string :register_type_code, null: false, default: '', limit: 5, comment: 'tabel register type id'
      t.references :courses_participant, null: false, foreign_key: true, default: 0, comment: "tabel courses participants id"
      t.references :course, null: false, foreign_key: true, default: 0, comment: "tabel courses id"
    end
  end
end
