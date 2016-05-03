require_relative 'spec_helper'

describe Unit do

  before :each do
    @footman = Footman.new
    @barrack = Barracks.new
    @siege_engine = SiegeEngine.new()
    @attacking_engine = SiegeEngine.new()
  end

  describe "#attack a footman" do
    it "should not be able to attack, 0 damage occured" do
      @attacking_engine.attack!(@footman)
      expect(@footman.health_points).to eq(60) #original HP is 60
    end
  end

  describe "attack a barrack" do
    it "do double damage (100) to the barrack" do
      @attacking_engine.attack!(@barrack)
      expect(@barrack.health_points).to eq(400) #original HP is 500
    end
  end

  describe "attack another engine" do
    it "do normal damage to the other engine" do
      @attacking_engine.attack!(@siege_engine)
      expect(@siege_engine.health_points).to eq(350) #original HP is 400
    end
  end

end

