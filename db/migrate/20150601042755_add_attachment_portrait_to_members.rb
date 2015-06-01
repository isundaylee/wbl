class AddAttachmentPortraitToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.attachment :portrait
    end
  end

  def self.down
    remove_attachment :members, :portrait
  end
end
