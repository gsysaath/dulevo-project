class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Locations" do |t|
      t.string :name, null: false, default: ""
      t.string :nation, null: false, default: ""
      t.string :language, null: false, default: "", limit: 2
    end
  end
end
