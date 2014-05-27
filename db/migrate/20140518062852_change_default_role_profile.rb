class ChangeDefaultRoleProfile < ActiveRecord::Migration
  def change
    change_column_default(:profiles, :role, 0)
  end
end
