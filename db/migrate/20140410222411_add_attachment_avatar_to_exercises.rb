class AddAttachmentAvatarToExercises < ActiveRecord::Migration
  def self.up
    change_table :exercises do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :exercises, :avatar
  end
end
