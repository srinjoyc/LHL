class SiegeEngine < Unit
  
  def initialize
    @health_points = 400
    @attack_power = 50
  end

  def attack!(enemy)
    if(enemy.instance_of?(Barracks))
      enemy.damage(@attack_power*2)
    elsif(enemy.instance_of?(SiegeEngine))
        enemy.damage(@attack_power)
    else
      enemy.damage(0)
    end
  end
end
