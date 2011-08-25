namespace :afa do
  desc "Generate admin user"
  task "admin" => :environment do
    u = User.new

    u.email = "admin"
    u.name = "admin"
    u.is_admin = true

    password = nil
    while password.blank?
      print "Write password for admin: "
      password = STDIN.gets.chomp
    end
    u.password = password

    u.save(false)
    puts ""
    puts "Admin generated with: :name => 'admin', :email => 'admin', :password => '#{password}'"
  end
end
