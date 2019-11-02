module Commands
  class ColourPixel
    attr_reader :row, :column, :colour

    def initialize(column, row, colour)
      # TODO: Handle the case where rows, columns are out of bound
      @row = row.to_i - 1
      @column = column.to_i - 1
      @colour = colour
    end

    def execute!(image)
      image[row, column] = colour
      image
    end
  end
end
