class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.integer :agetype
      t.integer :family_id

      t.timestamps
    end
  end

  def self.down
    drop_table :children
  end
end
