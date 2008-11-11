class CreateFoodItems < ActiveRecord::Migration
  def self.up
    create_table :food_items do |t|
      t.integer :quantity
      t.integer :lower
      t.integer :upper

      t.timestamps
    end
  end

  def self.down
    drop_table :food_items
  end
end
