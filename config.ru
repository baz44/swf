Dir["application.rb", "hello_show_response.rb", "default_response.rb", "controllers/*.rb"].each {|file| load file }
run Application.new
