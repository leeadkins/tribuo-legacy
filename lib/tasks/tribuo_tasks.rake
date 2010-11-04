desc "Create a new user with tribuo_create_user['email', 'pass']"
task :tribuo_create_user, :em, :pass, :needs => [:environment] do |t, args| 
  if User.create({:email => args.em, :password => args.pass, :password_confirmation => args.pass})
    puts "Created user: #{args.em}"
  else
    puts "There was an error creating the user"
  end
end
