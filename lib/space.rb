# frozen_string_literal: false

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

    @occupied = player
    self
  end

  def to_s
    case @occupied
    when :x
      'X'
    when :o
      'O'
    else
      @spot.to_s
    end
  end
end
