require_relative 'spec_helper'

describe Unit do

  describe "has lumber?" do
    it "should have 500 units of lumber on initialization" do
      barrack = Barracks.new
      expect(barrack.lumber).to eq(500)
    end
  end
end

