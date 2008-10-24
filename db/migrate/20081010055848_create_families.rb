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
      t.integer :foodonly
      t.integer :box
      t.references :user 
      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
