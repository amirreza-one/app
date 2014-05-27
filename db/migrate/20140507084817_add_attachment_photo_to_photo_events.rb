class AddAttachmentPhotoToPhotoEvents < ActiveRecord::Migration
  def self.up
    change_table :photo_events do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :photo_events, :photo
  end
end
