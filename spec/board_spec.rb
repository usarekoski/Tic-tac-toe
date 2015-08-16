require_relative './spec_helper.rb'

describe Board do

  let (:board) { Board.new }
  let (:state) { board.instance_variable_get(:@board_state) }

  before :each do
    @player = instance_double("Player", name: "Name", symbol: "X")
  end

  it "starts as empty board" do
    expect(state).to eql Array.new(9, '_')
  end

  it "#update? returns true for empty square" do
    state = board.update?(0,0, @player)
    expect(state).to be true
  end

  it "#update? updates one square to player.symbol" do
    board.update?(1,2, @player)
    result = Array.new(9,'_')
    result[2 * 3 + 3]

    expect(state.any? { |x| x == @player.symbol }).to be true
  end

  it "#update? updates the right square" do
    board.update?(1,2, @player)
    result = Array.new(9,'_')
    result[1 * 3 + 2] = @player.symbol
    expect(state).to eql result
  end

  it "#player_winning? is false at beginning" do
    expect(board.player_winning?(@player)).to be false
  end

  it "#player_winning? works for rows" do
    board.update?(0,0, @player)
    board.update?(0,1, @player)
    board.update?(0,2, @player)
    expect(board.player_winning?(@player)).to be true
  end

  it "#player_winning? works for columns" do
    board.update?(0,0, @player)
    board.update?(1,0, @player)
    board.update?(2,0, @player)
    expect(board.player_winning?(@player)).to be true
  end
  
  it "#player_winning? works for diagonals" do
    board.update?(0,0, @player)
    board.update?(1,1, @player)
    board.update?(2,2, @player)
    expect(board.player_winning?(@player)).to be true
  end

end

