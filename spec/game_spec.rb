require_relative './spec_helper.rb'

describe Game do

  let(:game) { Game.new(false) }

  it "should display welcome message" do
    expect($stdout).to receive(:puts).with(/Tic-tac-toe/)
    game.welcome
  end

end
