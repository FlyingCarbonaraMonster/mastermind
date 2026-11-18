# frozen_string_literal: true

require_relative 'player'
require_relative 'colors'

class HumanPlayer < Player
  def initialize(name = 'Player 1')
    super
  end

  # Prompt the player to choose a secret code
  def create_secret
    puts "#{name}, choose your 4-colors secret code from #{Colors::COLORS.keys.join(' ')}:"
    prompt_code
  end

  # Prompt the player to make a guess
  def make_guess
    puts "#{name}, insert your guess:"
    prompt_code
  end

  private

  # Acquire and validate user code
  def prompt_code
    loop do
      code = gets.chomp.upcase.delete(' ').chars
      return code if Colors.valid?(code)

      puts 'Invalid code, retry.'
    end
  end
end
