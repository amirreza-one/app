class AddAttachmentCoverToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :profiles, :cover
  end
end
