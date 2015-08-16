require_relative './spec_helper.rb'

describe Player do

  before :each do
    @player = Player.new("Name", "X")
  end

  it "has readable name" do
    expect(@player.name).to eq "Name"
  end

  it "has readable symbol" do
    expect(@player.symbol).to eq "X"
  end

end

