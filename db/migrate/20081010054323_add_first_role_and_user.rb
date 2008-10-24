class AddFirstRoleAndUser < ActiveRecord::Migration
  def self.up
    user = User.new
    user.login = "leeadkins"
    user.email = "lee@ravsonic.com"
    user.password = "revolution"
    user.password_confirmation = "revolution"
    user.name = "Lee Adkins"
    user.save(false)
    role = Role.new
    role.name = "admin"
    role.editown = 1
    role.editall = 1
    role.admin = 1
    role.save
    newAdmin = User.find_by_login("leeadkins")
    newRole = Role.find_by_name("admin")
    newRole.users << newAdmin
    newAdmin.save
    newRole.save
  end

  def self.down
  end
end
