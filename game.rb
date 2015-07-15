class Player
  attr_accessor :location, :items
  def initialize(location)
    @location = location
    @items = []
  end

  def look_around
    puts location[:location]
    location[:items].each do |item|
      puts "You see a #{item} on the floor."
    end
  end

  def pick_up(item)
    location[:items].delete(item)
    items << item
  end
end

class Map
  attr_accessor :current_location
  def initialize(locations)
    @locations = locations
    @current_location = @locations[0]
  end

  def describe
    puts current_location[:description]
  end

  def move_to(direction)
    @locations.each do |location|
      location[:edges].each do |edge|
        if edge[:direction] == direction
          current_location = edge[:location]
          puts current_location
        end
      end
    end
  end
end

location = { description: "You are in the living-room. A wizard is snoring loudly on the couch.",
             items: ["whiskey", "bucket"] }

locations = [{ name: "living_room",
               description: "You are in the living-room. A wizard is snoring loudly on the couch.",
               items: ["whiskey", "bucket"],
               edges: [{ direction: "upstairs",
                         item: "ladder",
                         location: "attic" }] }, {
               name: "attic",
               description: "You are in the attic. There is a giant welding torch in the corner.",
               edges: [{ direction: "downstairs",
                        item: "ladder",
                        location: "living_room" }] }]
player = Player.new(location)
player.look_around
player.pick_up("whiskey")
player.look_around
puts
map = Map.new(locations)
map.describe
map.move_to("upstairs")
map.describe