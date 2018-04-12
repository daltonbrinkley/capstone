require "unirest"
require "tty-prompt"
prompt = TTY::Prompt.new

system "clear"

puts "[login] Login (Create a JSON web token)"
puts "[signup] Sign-up (Create a new user)"
puts "[logout] Logout (Delete the JSON web token)"

input_option = gets.chomp
if input_option == "login"
  # puts "Please enter your email address: "
  # email = gets.chomp
  # password = prompt.mask("Please enter your password: ") 
  response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
      auth: {
        email: "brinkme@yahoo.com",
        password: "password"
      }
    }
  )
  jwt = response.body["jwt"]
  Unirest.default_header("Authorization", "Bearer #{jwt}")
elsif input_option == "signup"
  params = {}
  print "Please enter first name: "
  params["first_name"] = gets.chomp
  print "Please enter your last name: "
  params["last_name"] = gets.chomp
  print "Enter your email: "
  params["email"] = gets.chomp
  params["password"] = prompt.mask("What is your password?")
  params["password_confirmation"] = prompt.mask("Please re-enter your new password for verification: ")
  response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  p response.body  

  puts "You have successfully created your account.  Please enter your email address to login: "
  email = gets.chomp
  password = prompt.mask("Please enter your password: ") 
  response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
      auth: {
        email: "#{email}",
        password: "#{password}"
      }
    }
  )
  jwt = response.body["jwt"]
  Unirest.default_header("Authorization", "Bearer #{jwt}")
elsif input_option == "logout"
  jwt = ""
  Unirest.clear_default_headers()
end

system "clear"
puts "Your jwt is #{jwt}

"

puts "Choose an option"
puts "[1] Locations Index (all locations)"
puts "[1.1] Search Locations by Name: "

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/locations")
  locations = response.body
  puts JSON.pretty_generate(locations)

elsif input_option == "1.1"
  print "Please search names:"
  name_search = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/locations?input_name_search=#{name_search}")
  location = response.body
  puts JSON.pretty_generate(location)
end