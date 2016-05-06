require_relative 'errors'
require 'pry'
class Robot

  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items=[]
    @health = 100
    @weak_attack = 5
    @equipped_weapon = nil
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    if item.is_a?(BoxOfBolts) && health <= 80
      item.feed(self)
    end
    if (items_weight + item.weight) <= 250
      @items << item
        if item.is_a?(Weapon)
          @equipped_weapon = item
        end
      true
    end
  end

  def items_weight
    @items.inject(0) { |sum, item | sum + item.weight }
  end

  def wound(damage_points)
    if @health-damage_points > 0
      @health-=damage_points
    else
      @health = 0
    end
  end

  def heal(health_points)
    if @health+health_points < 100
      @health+=health_points
    else
      @health = 100
    end
  end

  def heal!(health_points)
    if @health <= 0
      raise RobotDeadException
    elsif @health+health_points < 100
        @health+=health_points
      else
        @health = 100
    end
  end

  def attack(enemy_robot)
      if @equipped_weapon == nil
        if within_range?(enemy_robot, 1)
          enemy_robot.wound(@weak_attack)
        end
      else
        if within_range?(enemy_robot, @equipped_weapon.range)
        @equipped_weapon.hit(enemy_robot)
        if(@equipped_weapon.reusable == false)
          @equipped_weapon = nil
        end
      end
    end
  end

  def within_range?  (robot2,range)
    delta_x2 = (robot2.position[0]-@position[0]).abs2
    delta_y2 = (robot2.position[1]-@position[1]).abs2
    distance = Math.sqrt(delta_x2+delta_y2)
    distance <= range
  end

   def attack!(enemy_robot)
     if !(enemy_robot.is_a?(Robot))
       raise NotAttackableException
       elsif(not :equipped_weapon.nil?)
         enemy_robot.wound(@weak_attack)
       end
       @equipped_weapon.hit(enemy_robot)
     end

end



=begin
ex = Robot.new()
item = Item.new('potion', 40)
item2 = Item.new('potion', 40)

ex.pick_up(item)
ex.pick_up(item2)

items=ex.items

puts items.to_s

puts ex.items_weight
=end







