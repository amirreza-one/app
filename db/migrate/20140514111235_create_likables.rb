class CreateLikables < ActiveRecord::Migration
  def change
    create_table :likables do |t|
      t.references :user, index: true
      t.references :photo_event, index: true

      t.timestamps
    end
  end
end
