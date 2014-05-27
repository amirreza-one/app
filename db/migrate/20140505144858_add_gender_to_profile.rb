class AddGenderToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gender, :integer , :default => 1
  end
end
