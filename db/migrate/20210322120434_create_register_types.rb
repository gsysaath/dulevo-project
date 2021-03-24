class CreateRegisterTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :register_types, id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci", comment: "Types register" do |t|
      t.bigint :id, null: false, unique: true, auto_increment: true, primary_key: true
      t.string :code, null: false, unique: true, limit: 1, default: 0
      t.string :nameIT, null: false, default: "", limit: 50, comment: "Italiano"
      t.string :nameEN, null: false, default: "", limit: 50, comment: "Inglese"
      t.string :nameFR, null: false, default: "", limit: 50, comment: "Francais"
      t.string :nameDE, null: false, default: "", limit: 50, comment: "Germain"
      t.string :nameES, null: false, default: "", limit: 50, comment: "Spana"
    end
  end
end
