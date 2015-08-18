require_relative './spec_helper.rb'

describe Game do

  let(:game) { Game.new(false) }

  before :each do
    @player = double("Player", name: "Name", symbol: "X")
  end

  it "should display welcome message" do
    expect($stdout).to receive(:puts).with(/Tic-tac-toe/)
    game.welcome
  end

end

