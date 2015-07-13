class Celsius
  def initialize(temp)
    @temp = temp
  end

  def convert
    (@temp * 1.8 + 32).round
  end

  def to_s
    "#{@temp} degrees C"
  end
end

