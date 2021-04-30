# frozen_string_literal: false

# Identifiers for each player
class Player
  attr_reader :flag
  
  def initialize(flag)
    @flag = flag
