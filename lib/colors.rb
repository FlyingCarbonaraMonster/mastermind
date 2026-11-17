# frozen_string_literal: true

require 'colorize'

module Colors
  # Hash that contains the valid colors
  COLORS = { 'R' => 'R'.red, 'B' => 'B'.blue, 'G' => 'G'.green, 'Y' => 'Y'.yellow, 'O' => 'O'.light_red,
             'C' => 'C'.cyan }.freeze

  # Check if the code is valid (array code has 4 elements and each of these is one of the keys of COLORS)
  def self.valid?(code)
    code.length == 4 && code.all? { |color| COLORS.key?(color) }
  end

  # Format the code, return a string with colorized letters
  def self.format_code(code)
    code.map { |color| COLORS[color] }.join(' ')
  end
end
