module Commands
  class ColourPixel
    attr_reader :colour, :pixel

    def initialize(column, row, colour)
      # TODO: Move this logic around pixels somewhere else
      @pixel = Pixel.new(x: column, y: row)
      @colour = colour
    end

    def execute(bitmap)
      bitmap.fill(pixel: pixel, colour: colour)
    end
  end
end
