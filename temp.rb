class Celsius
  def initialize(temp)
    @temp = temp.to_i
  end

  def convert
    "#{(@temp * 1.8 + 32).round} degrees F"
  end

  def to_s
    "#{@temp} degrees C"
  end
end

temperatures = {}
puts "Please enter the temperature for each day of the week:"
print "Monday: "
mon_temp = gets.chomp
temperatures["Mon"] = Celsius.new(mon_temp)
print "Tuesday: "
tue_temp = gets.chomp
temperatures["Tue"] = Celsius.new(tue_temp)
print "Wednesday: "
wed_temp = gets.chomp
temperatures["Wed"] = Celsius.new(wed_temp)
print "Thursday: "
thu_temp = gets.chomp
temperatures["Thu"] = Celsius.new(thu_temp)
print "Friday: "
fri_temp = gets.chomp
temperatures["Fri"] = Celsius.new(fri_temp)
print "Saturday: "
sat_temp = gets.chomp
temperatures["Sat"] = Celsius.new(sat_temp)
print "Sunday: "
sun_temp = gets.chomp
temperatures["Sun"] = Celsius.new(sun_temp)

temperatures.each_pair do |day, temp_obj|
  puts "#{day} | #{temp_obj.to_s} | #{temp_obj.convert}"
end