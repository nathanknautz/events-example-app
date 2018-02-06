require 'unirest'

while true
  system 'clear'
  print "Enter a keyword to search on: "
  input_keyword = gets.chomp
  print "Enter a city to search on: "
  input_city = gets.chomp
  response = Unirest.get("http://localhost:3000/events?keyword=#{input_keyword}&city=#{input_city}")
  events = response.body['_embedded']['events']
  events.each do |event|
    puts '=' * 50
    puts event["name"]
    puts '=' * 50
    puts "Start Date: #{event['dates']['start']['localDate']}"
    puts
    puts "Venue: "
    puts event['_embedded']['venues'][0]['name']
    puts
    puts
  end
  puts "Enter to continue or press 'q' to end."
  input_option = gets.chomp
  if input_option == 'q'
    exit
  end
end
