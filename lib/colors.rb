require 'colorize'

module Colors
  COLORS = { 'R' => 'R'.red, 'B' => 'B'.blue, 'G' => 'G'.green, 'Y' => 'Y'.yellow, 'O' => 'O'.light_red,
             'C' => 'C'.cyan }

  def self.valid?(arr)
    arr.length == 4 && arr.all? { |color| COLORS.key?(color) }
  end

  def self.format_code(arr)
    arr.map { |color| COLORS[color] }.join(' ')
  end
end
