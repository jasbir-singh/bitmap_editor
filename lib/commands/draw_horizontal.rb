require_relative '../pixel'

module Commands
  class DrawHorizontal
    attr_reader :start_column, :end_column, :row, :colour

    def initialize(start_column, end_column, row, colour)
      @start_column = start_column
      @end_column = end_column
      raise StandardError, 'X2 has to be greater or equal to X1' if start_column > end_column

      @row = row
      @colour = colour
    end

    def execute(bitmap)
      (start_column..end_column).each do |x|
        bitmap.fill(pixel: Pixel.new(x: x, y: row), colour: colour)
      end
    end
  end
end
