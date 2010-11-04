module Tribuo
  module Generators
    class UserGenerator < Rails::Generators::Base
      desc "Creates a user in the Tribuo database."
      argument :email, :type => :string
      argument :password, :type => :string
      
      def create_user
        User.create({:email => email, :password => password, :password_confirmation => password})
        puts "Created user: #{email}"
      end
    end
  end  
end