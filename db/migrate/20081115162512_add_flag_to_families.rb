class AddFlagToFamilies < ActiveRecord::Migration
  def self.up
    add_column :families, :flag, :boolean, :default => false
  end

  def self.down
    remove_column :families, :flag
  end
end
