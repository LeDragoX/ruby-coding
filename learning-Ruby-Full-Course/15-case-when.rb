# ruby 15-case-when.rb

def get_day_name (day = "mon")
    day_name = ""

    case (day)
    when "mon"
        day_name = "Monday"
    when "tue"
        day_name = "Tuesday"
    when "wed"
        day_name = "Wednesday"
    when "thu"
        day_name = "Thursday"
    when "fri"
        day_name = "Friday"
    when "sat"
        day_name = "Saturday"
    when "sun"
        day_name = "Sunday"
    else
        puts ("[E]: Invalid entry! Try: Mon | Tue | Wed | Thu | Fri | Sat | Sun")
    end

    return day_name
end

print ("Enter a day: ")
puts (get_day_name(gets().chomp().downcase()))