require 'pry'

class BoxOfBolts < Item

  attr_reader :health_points

  def initialize
    @name = "Box of bolts"
    @weight = 25
    @health_points=20
  end

  def feed(robot)
    robot.heal(@health_points)
  end
end
