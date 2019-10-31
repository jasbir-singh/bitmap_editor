class Commands::DrawVertical
  attr_reader :column, :row1, :row2, :colour

  def initialize(column, row1, row2, colour)
    @column = column.to_i - 1
    @row1 = row1.to_i - 1
    @row2 = row2.to_i - 1
    @colour = colour
  end

  def execute!(image)
    (row1..row2).each do |row|
      image[row, column] = colour
    end
    image
  end
end
