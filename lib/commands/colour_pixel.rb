module Commands
  class ColourPixel
    attr_reader :row, :column, :colour

    def initialize(column, row, colour)
      @row = row.to_i - 1
      @column = column.to_i - 1
      @colour = colour
    end

    def execute!(image)
      image.fill(row: row, column: column, colour: colour)
      image
    end
  end
end
