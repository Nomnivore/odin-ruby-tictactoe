# frozen_string_literal: false

require_relative './board'
require_relative './player'
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

def get_spot(board)
  print '#: '
  spot = board.get_space(gets.chomp.to_i)
  return get_spot(board) unless spot

  if spot.occupied?
    puts 'That space has already been played.'
    return get_spot(board)
  end

  spot.spot
end

game_state = :new

while game_state
  case game_state
  when :new
    first = true
    board = nil
    turn = rand.round.zero? # picks who to start first randomly
    winner = false

    system 'clear'
    puts 'Welcome to Ruby TicTacToe! This game will consist of 2 local players. Are you ready to play?'.bold
    ready = yes_or_no
    unless ready
      game_state = nil # calls to exit the program
      next
    end
    puts "\n#{'Player 1 (X)'.bold}, please enter your name:"
    p1name = gets.chomp
    puts "\n#{'Player 2 (O)'.bold}, please enter your name:"
    p2name = gets.chomp
    board = Board.new(Player.new(:x, p1name), Player.new(:o, p2name))
    game_state = :play
  when :play
    system 'clear'
    plr = board.get_player(turn)
    header = "#{plr.to_s.bold}, it's your turn#{first ? ' first.' : '.'}"
    puts header
    puts "\n#{board}"
    puts "\nPlease enter 1-9 corresponding to the space you want to play."

    spot = get_spot(board)
    board.play(spot, plr.flag)
    first = false
    turn = !turn

    winner = board.check_winner
    game_state = :end if winner
  when :end
    system 'clear'
    header = if winner == :tie
               "GG! It's a draw!".bold.green
             else
               "#{board.get_player(winner).name} wins!".bold.blue
             end
    puts header
    puts "\n#{board}"
    puts "\nWould you like to start a new game?".bold
    game_state = yes_or_no ? :new : nil
  end
end
