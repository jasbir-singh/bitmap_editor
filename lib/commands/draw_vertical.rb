module Commands
  class DrawVertical
    attr_reader :column, :row1, :row2, :colour

    def initialize(column, row1, row2, colour)
      @column = column
      @row1 = row1
      @row2 = row2
      @colour = colour
    end

    def execute!(bitmap)
      (row1..row2).each do |row|
        bitmap.fill(pixel: Pixel.new(x: column, y: row), colour: colour)
      end
    end
  end
end
