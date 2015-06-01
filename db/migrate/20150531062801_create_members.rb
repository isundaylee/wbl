class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :title
      t.boolean :exec

      t.timestamps null: false
    end
  end
end
