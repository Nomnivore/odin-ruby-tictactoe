# frozen_string_literal: false

# Identifiers for each player
class Player
  attr_reader :flag, :name

  def initialize(flag, name = nil)
    name ||= flag.to_s.upcase

    @flag = flag
    @name = name.capitalize
  end

  def to_s
    "#{@name} (#{@flag.to_s.upcase})"
  end
end
