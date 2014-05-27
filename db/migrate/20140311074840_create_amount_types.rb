class CreateAmountTypes < ActiveRecord::Migration
  def change
    create_table :amount_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
