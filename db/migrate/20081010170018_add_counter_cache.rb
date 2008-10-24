class AddCounterCache < ActiveRecord::Migration
  def self.up
    add_column :families, :children_count, :integer, :default => 0
  end

  def self.down
    remove_column :families, :children_count
  end
end
