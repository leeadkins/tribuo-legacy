class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :lastname
      t.string :firstname
      t.string :phone
      t.string :address
      t.string :directions
      t.integer :familysize
      t.integer :childrensize
      t.boolean :foodonly, :default => false
      t.integer :box
      t.integer :user_id
      t.integer :children_count, :default => 0
      t.boolean :pickup, :default => false
      t.boolean :flag, :default => false
      t.datetime :completed_on
      t.boolean :reserve, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
