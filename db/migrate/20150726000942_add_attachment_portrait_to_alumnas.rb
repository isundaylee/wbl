class AddAttachmentPortraitToAlumnas < ActiveRecord::Migration
  def self.up
    change_table :alumnas do |t|
      t.attachment :portrait
    end
  end

  def self.down
    remove_attachment :alumnas, :portrait
  end
end
