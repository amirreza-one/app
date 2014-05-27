class CreateRequestFriendships < ActiveRecord::Migration
  def change
    create_table :request_friendships do |t|
      t.integer :user_id , index: true
      t.integer :request_to_id , index: true

      t.timestamps
    end
  end
end
