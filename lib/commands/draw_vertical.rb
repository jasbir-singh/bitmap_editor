require_relative '../numeric'
require_relative '../pixel'

module Commands
  class DrawVertical
    attr_reader :column, :start_row, :end_row, :colour

    def initialize(column, start_row, end_row, colour)
      @column = Numeric.parse_positive_integer(column)
      raise InvalidArgumentError, 'Y' if start_row > end_row

      @start_row = Numeric.parse_positive_integer(start_row)
      @end_row = Numeric.parse_positive_integer(end_row)
      @colour = colour
    end

    def execute(bitmap)
      (start_row..end_row).each do |row|
        bitmap.fill(pixel: Pixel.new(x: column, y: row), colour: colour)
      end
    end
  end
end
