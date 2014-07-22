puts "Name is: #{ENV["NAME"]}"
ENV["NAME"] = "Jeff"
puts "Now name is: #{ENV["NAME"]}"


ENV["WOULD_RISK_HIS_NECK_FOR_HIS_BROTHER_MAN"] = "Shaft"
puts ENV["WOULD_RISK_HIS_NECK_FOR_HIS_BROTHER_MAN"]

def env_value(value)
  environment = ENV[value]
  puts "Migrate the #{environment} database"
end

puts env_value("DOG")



def hungry(value)
  if value == true
    puts "FEED ME"
  else
    puts "NOT NOW"
  end
end





puts "Favorite color in parent starts as: #{ENV['FAVORITE_COLOR']}"

fork do
  puts "Favorite color in child starts as: #{ENV['FAVORITE_COLOR']}"
  ENV["FAVORITE_COLOR"] = 'red'
  puts "Favorite color in child ends as: #{ENV['FAVORITE_COLOR']}"
end

puts "Favorite color in parent ends as: #{ENV['FAVORITE_COLOR']}"
