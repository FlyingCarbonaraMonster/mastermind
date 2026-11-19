# frozen_string_literal: true

require_relative 'player'
require_relative 'colors'
require_relative 'feedback'

class ComputerPlayer < Player
  # Initialize computer player with default name and array with permutation of
  # all possible colors
  def initialize(name = 'Computer')
    super
    @possible_codes = Colors::COLORS.keys.repeated_permutation(4).to_a
  end

  # Create secret code when the computer is the codemaker
  def create_secret
    Array.new(4) { Colors::COLORS.keys.sample }
  end

  # Return a possible code, chosen randomly from the array of valid codes
  def make_guess
    puts "#{name} is thinking..."
    @possible_codes.sample
  end

  # Keeps only the codes that produce the same feedback when evaluated against guess
  def receive_feedback(guess, feedback)
    @possible_codes.select! { |code| feedback == Feedback.evaluate(code, guess) }
  end
end
