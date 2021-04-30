# frozen_string_literal: false

# @state = [
#   [7,8,9],
#   [4,5,6],
#   [1,2,3]
# ]

# Checking for winner
module Logic
  def check_winner
    winner = check_rows || check_cols || check_diags
    if winner
      winner
    else
      # checks for ties
      @state.flatten.reject(&:occupied?)[0] ? false : :tie
    end
  end

  private

  def all_eql(x, y, z) # rubocop:disable Naming/MethodParameterName
    return false unless x.occupied?

    return x.occupied if x.occupied == y.occupied && x.occupied == z.occupied
  end

  def check_rows
    all_eql(*@state[0]) || all_eql(*@state[1]) || all_eql(*@state[2])
  end

  def check_cols
    [0, 1, 2].each do |i|
      flat = @state.flatten
      check = all_eql(flat[i], flat[i + 3], flat[i + 6])
      return check if check
    end
    false
  end

  def check_diags
    # i don't know of a way to not hardcode this
    check1 = all_eql(@state[0][0], @state[1][1], @state[2][2])
    check2 = all_eql(@state[2][0], @state[1][1], @state[0][2])
    check1 || check2
  end
end
