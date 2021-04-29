# frozen_string_literal: false

require './board'

# Handles the control flow of the game
class Tictactoe
  def initialize
    @board = Board.new()
    @players = [:x, :o]
  end

  def start 
    # game loop logic goes here
  end
end
