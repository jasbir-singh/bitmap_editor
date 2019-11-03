require_relative '../numeric'
require_relative '../pixel'
require_relative './invalid_argument_error'

module Commands
  class DrawHorizontal
    attr_reader :start_column, :end_column, :row, :colour

    def initialize(start_column, end_column, row, colour)
      @start_column = Numeric.parse_positive_integer(start_column)
      @end_column = Numeric.parse_positive_integer(end_column)
      raise InvalidArgumentError, 'X'  if start_column > end_column

      @row = Numeric.parse_positive_integer(row)
      @colour = colour
    end

    def execute(bitmap)
      (start_column..end_column).each do |x|
        bitmap.fill(pixel: Pixel.new(x: x, y: row), colour: colour)
      end
    end
  end
end
