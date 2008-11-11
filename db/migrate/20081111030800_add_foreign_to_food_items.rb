class AddForeignToFoodItems < ActiveRecord::Migration
  def self.up
    add_column :food_items, :food_id, :integer
  end

  def self.down
    remove_column :food_items, :food_id
  end
end
