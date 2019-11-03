module Commands
  class DrawVertical
    attr_reader :column, :row1, :row2, :colour

    def initialize(column, row1, row2, colour)
      @column = column
      @row1 = row1
      @row2 = row2
      @colour = colour
    end

    def execute!(image)
      (row1..row2).each do |row|
        image.fill(pixel: Pixel.new(x: column, y: row), colour: colour)
      end
      image
    end
  end
end
