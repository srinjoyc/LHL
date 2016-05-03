require_relative 'spec_helper'

describe Unit do
  before :each do
    @attacker = Footman.new
    @unit_dead = Unit.new(-30, 10)
    @unit_alive = Unit.new(30,10)
  end
  describe "#attacker attempts to attacks HP < 0 " do
    it "raise an error from attacking a dead unit" do
     expect(@attacker.attack!(@unit_dead)).to be false
    end
  end
  describe "attacker attacks a live unit until it dies" do
    it "unit should die and raise an error after several attacks" do
      @attacker.attack!(@unit_alive) # AP is 10, so have to attack more than 3 times
      @attacker.attack!(@unit_alive)
      @attacker.attack!(@unit_alive)
      expect(@unit_alive.dead?).to be true #500HP barracks - 10AP/2 (from footman)
    end
  end
end

