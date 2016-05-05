class Weapon < Item

  attr_reader :name, :weight, :damage, :range, :reusable

  def initialize(name, weight, damage)
    @name = name
    @weight = weight
    @damage = damage
    @range = 1
    @reusable = true
  end

  def hit (enemy_robot)
    enemy_robot.wound(@damage)
  end
end
