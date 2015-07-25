class CreateClubDigests < ActiveRecord::Migration
  def change
    create_table :club_digests do |t|
      t.integer :volume
      t.integer :number

      t.timestamps null: false
    end
  end
end
