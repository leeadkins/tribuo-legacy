class AddPickupToFamilies < ActiveRecord::Migration
  def self.up
    add_column :families, :pickup, :integer
  end

  def self.down
    remove_column :families, :pickup
  end
end
