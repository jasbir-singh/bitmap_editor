require 'forwardable'
require 'matrix'

class Bitmap
  WHITE_COLOUR = 'O'.freeze

  class OutOfBoundError < StandardError
    def message
      'Co-ordinates are out of bound.'
    end
  end

  extend Forwardable

  def_delegators :@image, :row_size, :column_size, :each_with_index, :each, :to_a

  attr_accessor :image

  def initialize(rows:, columns:)
    @image = Matrix.build(rows, columns) { WHITE_COLOUR }
  end

  def clear!
    each_with_index do |_e, row, col|
      image[row, col] = WHITE_COLOUR
    end
  end

  def fill(pixel:, colour:)
    validate_bounds(pixel.row, pixel.column)

    image[pixel.row - 1, pixel.column - 1] = colour
    self
  end

  def fetch(pixel:)
    validate_bounds(pixel.row, pixel.column)

    image[pixel.row - 1, pixel.column - 1]
  end

  def to_s
    to_a.map(&:join).join("\n")
  end

  private

  def validate_bounds(row, column)
    raise OutOfBoundError if row > row_size || column > column_size
  end
end
