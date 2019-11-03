require_relative '../pixel'

module Commands
  class DrawHorizontal
    attr_reader :column1, :column2, :row, :colour

    def initialize(column1, column2, row, colour)
      @column1 = column1
      @column2 = column2
      @row = row
      @colour = colour
    end

    def execute(bitmap)
      (column1..column2).each do |x|
        bitmap.fill(pixel: Pixel.new(x: x, y: row), colour: colour)
      end
    end
  end
end
