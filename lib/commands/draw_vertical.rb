module Commands
  class DrawVertical
    attr_reader :column, :start_row, :end_row, :colour

    def initialize(column, start_row, end_row, colour)
      @column = column
      raise StandardError, 'Y2 has to be greater or equal to Y1' if start_row > end_row

      @start_row = start_row
      @end_row = end_row
      @colour = colour
    end

    def execute(bitmap)
      (start_row..end_row).each do |row|
        bitmap.fill(pixel: Pixel.new(x: column, y: row), colour: colour)
      end
    end
  end
end
