# http://classic.battle.net/war3/human/units/footman.shtml
require 'pry'

class Footman < Unit

  attr_accessor :health_points

  def initialize
    @health_points=60
    @attack_power=10
  end

  def attack!(enemy)
    if (enemy.instance_of?(Barracks))
      enemy.damage((@attack_power/2).ceil)
      else
        super(enemy)
    end
  end

end
