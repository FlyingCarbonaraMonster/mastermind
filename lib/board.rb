# frozen_string_literal: true

require 'colorize'
require_relative 'colors'

class Board
  FEEDBACK_PEGS = { exact: '●'.red, partial: '○'.white }.freeze

  def initialize
    @turns = []
  end

  # Record a new turn, guess and its feedback, in the game history
  def add_turn(guess, feedback)
    @turns << { guess: guess, feedback: feedback }
  end

  # Display the board
  def display
    puts "\n---- BOARD GAME ----"
    @turns.each_with_index do |turn, index|
      puts "#{format('%2d', index + 1)} #{Colors.format_code(turn[:guess])} | #{format_feedback(turn[:feedback])}"
    end
    puts '--------------------'
  end

  private

  # Format the feedback transforming every value of feedback into the respective value
  # of FEEDBACK_PEGS
  def format_feedback(feedback)
    return '-' if feedback.empty?

    feedback.map { |peg| FEEDBACK_PEGS[peg] }.join(' ')
  end
end
