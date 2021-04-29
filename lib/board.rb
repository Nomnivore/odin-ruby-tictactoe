# frozen_string_literal: false

require './space'
require './logic'
# Tictactoe game board
class Board
  include Logic
  attr_reader :state

  private

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

  private

  def get_space(num)
    @state.flatten.select { |x| x.spot == num }[0]
  end

  def play(spot, flag)
    return unless %i[x o].include?(flag)
    
    space = get_space(spot)
    return false if space.occupied

    space.occupy(flag)
  end

  def to_s
    " %s | %s | %s \n"\
    "―――|―――|―――\n"\
    " %s | %s | %s \n"\
    "―――|―――|―――\n"\
    ' %s | %s | %s ' % @state.flatten # rubocop:disable Style/FormatString
  end
end

Board.new.check
# print Board.new.board.to_s
