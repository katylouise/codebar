class Member
  attr_accessor :full_name
  def initialize(full_name)
    @full_name = full_name
  end
end

class Student < Member
  attr_accessor :about
  def initialize(full_name, about)
    super(full_name)
    @about = about
  end
end

class Coach < Member
  attr_accessor :bio
  def initialize(full_name, bio)
    super(full_name)
    @bio = bio
    @skills = []
  end

  def add_skill(skill)
    @skills << skill
  end

  def skills
    skills_str = ""
    @skills.each{ |s| skills_str += "#{s}, " }
    skills_str.rstrip.chop
  end
end

class Workshop
  attr_accessor :date, :venue_name, :coaches, :students
  def initialize(date, venue_name)
    @date = date
    @venue_name = venue_name
    @coaches = []
    @students = []
  end

  def add_participant(member)
    if member.is_a?(Student)
      students << member
    else
      coaches << member
    end
  end

  def print_details
    puts "#"
    print_workshop_details
    puts "#"
    print_student_details
    puts "#"
    print_coach_details
  end

  private
  def print_workshop_details
    puts "# Workshop - #{self.date} - Venue: #{venue_name}"
  end

  def print_student_details
    puts "# Students"
    students.each_with_index{ |s, i| puts "# #{i + 1}. #{s.full_name} - #{s.about}"}
  end

  def print_coach_details
    puts "# Coaches"
    coaches.each_with_index{ |c, i| puts "# #{i + 1}. #{c.full_name} - #{c.skills}\n# #{c.bio}"}
  end
end

workshop = Workshop.new("12/03/2014", "Shutl")

jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Coach.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Coach.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")

workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)
workshop.print_details


