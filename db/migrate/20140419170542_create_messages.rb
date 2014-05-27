class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_id , index: true
      t.integer :to_id , index: true
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
