class AddFirstRoleAndUser < ActiveRecord::Migration
  def self.up
    #you'll want to fix this to your liking
    user = User.new
    user.login = "admin"
    user.email = "me@here.com"
    user.password = "admin"
    user.password_confirmation = "admin"
    user.name = "Lee Adkins"
    user.save(false)
    role = Role.new
    role.name = "admin"
    role.editown = 1
    role.editall = 1
    role.admin = 1
    role.save
    newAdmin = User.find_by_login("admin")
    newRole = Role.find_by_name("admin")
    newRole.users << newAdmin
    newAdmin.save
    newRole.save
  end

  def self.down
  end
end
