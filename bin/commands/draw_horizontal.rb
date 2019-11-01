module Commands
  class DrawHorizontal
    attr_reader :column1, :column2, :row, :colour

    def initialize(column1, column2, row, colour)
      @column1 = column1.to_i - 1
      @column2 = column2.to_i - 1
      @row = row.to_i - 1
      @colour = colour
    end

    def execute!(image)
      (column1..column2).each do |column|
        image[row, column] = colour
      end
      image
    end
  end
end
