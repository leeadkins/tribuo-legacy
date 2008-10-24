class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :name
      t.string :value
      t.string :friendly

      t.timestamps
    end
    current = Setting.new
    current.name = "boxgenerated"
    current.value = "0"
    current.friendly = "Have numbers been generated? 0 for no, 1 for yes"
    current.save(false)
    
    current = Setting.new
    current.name = "lastbox"
    current.value = "0"
    current.friendly = "Contains the last box number generated"
    current.save
  end

  def self.down
    drop_table :settings
  end
end
