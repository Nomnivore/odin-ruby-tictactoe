# frozen_string_literal: false

require './space'
# Tictactoe game board
class Board
  attr_reader :state

  def default_rows
    [
      [7, 8, 9],
      [4, 5, 6],
      [1, 2, 3]
    ]
  end

  def initialize
    # create a new blank board
    @state = []
    default_rows.each_with_index do |row, ind|
      @state[ind] = []
      row.each { |col| @state[ind].push(Space.new(col)) }
    end
  end

  def to_s
    " %s | %s | %s \n"\
    "―――|―――|―――\n"\
    " %s | %s | %s \n"\
    "―――|―――|―――\n"\
    ' %s | %s | %s ' % @state.flatten # rubocop:disable Style/FormatString
  end
end

puts Board.new
# print Board.new.board.to_s
