# frozen_string_literal: true

require_relative 'lib/colors'
require_relative 'lib/feedback'

p Feedback.evaluate(%w[R B G Y], %w[R B G Y])
p Feedback.evaluate(%w[R B G Y], %w[O O C C])
p Feedback.evaluate(%w[R B G Y], %w[Y G B R])
p Feedback.evaluate(%w[R B G Y], %w[R R R R])
p Feedback.evaluate(%w[R B R G], %w[B R Y R])
puts Colors.format_code(%w[R B G Y O C])
