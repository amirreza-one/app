class AddAttachmentAvatarToFoods < ActiveRecord::Migration
  def self.up
    change_table :foods do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :foods, :avatar
  end
end
