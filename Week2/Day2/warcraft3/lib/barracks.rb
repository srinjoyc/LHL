class Barracks

  attr_accessor :gold, :food, :lumber
  attr_reader :health_points

  def initialize
    @gold= 1000
    @food=80
    @health_points=500
    @lumber=500
  end

  def can_train_footman?
    if self.gold > 135 && self.food > 2
      return true
    end
    return false
  end

  def train_footman
    if can_train_footman?
      @gold-=135
      @food-=2
      Footman.new()
    end
  end

  def can_train_peasant?
    if self.gold > 90 && self.food > 5
      return true
    end
    return false
  end

  def train_peasant
    if can_train_peasant?
      @gold-=90
      @food-=5
      Peasant.new()
    end
  end

  def damage (ap)
    if (health_points > 0)
      @health_points-= ap
    end
  end
end
