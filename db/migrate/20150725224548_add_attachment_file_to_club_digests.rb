class AddAttachmentFileToClubDigests < ActiveRecord::Migration
  def self.up
    change_table :club_digests do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :club_digests, :file
  end
end
