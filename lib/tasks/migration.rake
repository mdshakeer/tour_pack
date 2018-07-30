namespace :initial_setup do
  desc "Initial Users"
  task default_user_setup: :environment do
  	puts "----------Creating Users-----------"
  	User.create(name:"Shakeer",user_type:"ADMIN",email:"mdshakeer91@gmail.com",password:"12345678")
  	User.create(name:"Guest",user_type:"GUEST",email:"guest@gmail.com",password:"12345678")
  	puts "-----2 Users were created----"
  end

end

task :setup_list => ["db:create", "db:migrate", "initial_setup:default_user_setup"]
