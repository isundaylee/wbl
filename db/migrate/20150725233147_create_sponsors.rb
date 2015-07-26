class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.integer :level

      t.timestamps null: false
    end
  end
end
