# Represents Tic-tac-toe game's grid.
# The size of grid is 3x3.
class Board
  # Fill empty 3x3 board with '_' characters.
  def initialize
    @board_state = Array.new(9, '_')
  end

  def to_s
    divider = " " + "¤"*11 + "\n"
    row = lambda {|i, j| " " + @board_state.slice(i,j).join(" ¤ ") + " \n" }

    "  1   2   3\n" + divider + "1" + row.call(0, 3) + divider + "2" \
      + row.call(3, 3) + divider + "3" + row.call(6, 3) + divider
  end

  def update?(row, col, player)
    position = row * 3 + col
    if @board_state[position] == "_"
      @board_state[position] = player.symbol
      return true
    else
      return false
    end
  end

  def player_winning?(player)
    rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    columns = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    verticals = [[0,4,8], [2, 4, 6]]

    (rows + columns + verticals).any? do |positions|
      winning_row?(player, positions)
    end
  end

  private

  def winning_row?(player, positions)
    @board_state.values_at(*positions).all? do |symbol|
      symbol == player.symbol
    end
  end

end

