namespace :afa do
  desc "Generate admin user"
  task "admin" => :environment do
    u = User.find_or_initialize_by_email_and_name_and_is_admin("admin", "admin", true)

    password = nil
    while password.blank?
      print "Write password for admin: "
      password = STDIN.gets.chomp
    end
    u.password = password

    u.save(:validate => false)
    puts ""
    puts "Admin generated with: :name => 'admin', :email => 'admin', :password => '#{password}'"
  end
end
