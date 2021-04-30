# frozen_string_literal: false

require 'colorize'

# This class will serve as each of the 9 components of the game board
class Space
  attr_reader :spot, :occupied

  @occupied = nil
  @spot = 0
  def initialize(spot)
    @spot = spot
    @occupied = nil
  end

  def occupy(flag)
    return unless %i[x o].include?(flag)

    @occupied = flag
    self
  end

  def occupied?
    @occupied ? true : false
  end

  def to_s
    case @occupied
    when :x
      'X'.bold
    when :o
      'O'.bold
    else
      @spot.to_s
    end
  end
end
