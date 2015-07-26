class CreateAlumnas < ActiveRecord::Migration
  def change
    create_table :alumnas do |t|
      t.string :name
      t.text :bio

      t.timestamps null: false
    end
  end
end
