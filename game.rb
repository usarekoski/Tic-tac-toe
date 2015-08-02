#!/usr/bin/env ruby

# A simple 2-player text-based Tic-tac-toe game.

# Played on 3x3 grid, players add mark with symbol X or O
# to the grid in turns until one player gets three symbols in
# to a row. They can be vertically, horizontally or diagonally.
# The player who starts second gets one turn after first player
# gets three in a row and can try to get the game to a draw.

class Game
  require_relative 'player'
  require_relative 'board'

  def initialize
    @board = Board.new
    welcome
    create_players
    play
  end

  private

  def welcome
    puts " " * 5 + "Tic-tac-toe"
  end

  def create_players
    puts "Give name to first player (playing as 'X'):"
    name1 = Kernel.gets.chomp
    @player1 = Player.new(name1, 'X')
    puts "Player #{@player1.name} created"

    puts "Give name to second player (playing as 'O'):"
    name2 = Kernel.gets.chomp
    @player2 = Player.new(name2, 'O')
    puts "Player #{@player2.name} created"
  end

  def play
    until game_over?
      puts @board.to_s
      ask_move(@player1)
      puts @board.to_s
      ask_move(@player2)
    end
    if @board.player_winning?(@player1)
      if @board.player_winning?(@player2)
        puts "Game ended in draw"
      else
        puts "#{@player1.name} has won!"
      end
    else
      puts "#{@player2.name} has won!"
    end
  end

  def ask_move(player)
    puts "#{player.name}'s (#{player.symbol}) turn "
    loop do
      puts "Give coordinates of your next move:"
      puts "row:"
      coord_h = get_coord - 1
      puts "column:"
      coord_v = get_coord - 1
      break if @board.update?(coord_h, coord_v, player)
      puts "That square is not empty. Try again."
    end
  end

  def get_coord
    begin
      coord = Kernel.gets.to_i
      if coord < 1 || coord > 3
        raise "Wrong size"
      end
    rescue
      puts "Not a correct coordinate. Try again"
      retry
    else
      coord
    end
  end

  def game_over?
    @board.player_winning?(@player1) || @board.player_winning?(@player2)
  end

end

if $0 == __FILE__
  Game.new
end

