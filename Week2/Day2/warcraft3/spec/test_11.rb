require_relative 'spec_helper'

describe Footman do
    before :each do
      @attacker = Footman.new
      @building = Barracks.new
      @unit = Unit.new(30, 10)
    end
    describe "#damage_building_from_footman" do
      it "should reduce buildings health by half the AP of this unit" do
        @attacker.attack!(@building)
        expect(@building.health_points).to eq(495) #500HP barracks - 10AP/2 (from footman)
      end
    end
    describe "#damage_building_from_unit" do
      it "should reduce buildings health by the full AP of this unit" do
        @unit.attack!(@building)
        expect(@building.health_points).to eq(490) #500HP barracks - 10AP/2 (from footman)
      end
    end
end

