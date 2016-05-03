class Unit

  attr_reader :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    enemy.damage(attack_power)
  end

  def damage(ap)
    if not dead?
      @health_points-=ap
    else
      return false
    end
  end

  def dead?
    if (@health_points <= 0)
      true
    end
    false
  end

  # def damage_building (building)
  #   building.damage((@attack_power/2).ceil)
  # end
end
