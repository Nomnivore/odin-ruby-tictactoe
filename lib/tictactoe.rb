# frozen_string_literal: false

require_relative './board'
require 'colorize'

def yes_or_no(prompt = 'Y/N: ')
  print prompt
  input = gets.chomp
  if input.downcase.include?('y') # rubocop:disable Style/GuardClause
    return true
  elsif input.downcase.include?('n')
    return false
  end

  yes_or_no(prompt)
end

game_state = :new

while game_state
  case game_state
  when :new
    system 'clear'
    puts 'Welcome to Ruby TicTacToe! This game will consist of 2 local players. Are you ready to play?'.bold
    ready = yes_or_no
    unless ready
      game_state = nil # calls to exit the program
      next
    end
  end
end
