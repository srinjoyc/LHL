class Grenades < Weapon

  attr_reader :name, :weight, :damage, :range, :reusable

  def initialize
    @name = "Grenade"
    @weight = 40
    @damage = 15
    @range = 2
    @reusable = false
  end
end
