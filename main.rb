# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/feedback'

secret = %w[R B G Y]
board = Board.new
guess1 = %w[O O C C]
board.add_turn(guess1, Feedback.evaluate(secret, guess1))
guess2 = %w[R Y G O]
board.add_turn(guess2, Feedback.evaluate(secret, guess2))
guess3 = %w[R G B Y]
board.add_turn(guess3, Feedback.evaluate(secret, guess3))
board.display
