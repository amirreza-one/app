class CreateAuxilaryProfiles < ActiveRecord::Migration
  def change
    create_table :auxilary_profiles do |t|
      t.integer :weight
      t.integer :height
      t.references :profile, index: true

      t.timestamps
    end
  end
end
