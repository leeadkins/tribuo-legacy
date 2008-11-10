class CreateNewDefaultSetting < ActiveRecord::Migration
  def self.up
    current = Setting.new
    current.name = "maintenance"
    current.value = "0"
    current.friendly = "Is the system in maintenance? 0 for no, 1 for yes"
    current.save(false)
  end

  def self.down
  end
end
