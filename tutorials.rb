

class Tutorial
  attr_accessor :type, :difficulty
  def initialize(name, type, difficulty)
    @name = name
    @type = type
    @difficulty = difficulty
  end

  def is_harder_than?(tutorial)
    ratings = {:easy => 1, :medium => 2, :hard => 3, :advanced => 4, :expert => 5}
    types = {:ruby => "Ruby", :javascript => "JavaScript", :python => "Python", :html => "HTML", :css => "CSS"}

    if self.type != tutorial.type
      "You can not compare a #{types[self.type]} tutorial with a #{types[tutorial.type]} tutorial."
    else
      ratings[self.difficulty] > ratings[tutorial.difficulty] ? true : false
    end
  end
end

tutorial1 = Tutorial.new("Object Oriented Ruby", :ruby, :medium)
tutorial2 = Tutorial.new("Introduction to JavaScript", :javascript, :easy)
tutorial3 = Tutorial.new("HTTP Requests, AJAX and APIs", :javascript, :medium)

puts tutorial1.is_harder_than?(tutorial2)
# You cannot compare a Ruby with a JavaScript tutorial

puts tutorial2.is_harder_than?(tutorial1)
# You cannot compare a JavaScript with a Ruby tutorial

puts tutorial2.is_harder_than?(tutorial3)
# false

puts tutorial3.is_harder_than?(tutorial2)
# true