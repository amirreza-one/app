class CreatePhotoEvents < ActiveRecord::Migration
  def change
    create_table :photo_events do |t|
      t.text :summary
      t.references :profile, index: true

      t.timestamps
    end
  end
end
