require 'forwardable'
require 'matrix'

class Bitmap
  class OutOfBoundError < StandardError
    def new(message)
      super(message)
    end
  end

  WHITE_COLOUR = 'O'.freeze

  extend Forwardable
  def_delegators :@image, :row_size, :column_size, :each_with_index, :each, :to_a

  attr_accessor :image

  def initialize(rows: nil, columns: nil)
    create!(rows: rows, columns: columns) if rows || columns
  end

  def create!(rows:, columns:)
    raise StandardError, 'Please also provide number of columns' if !columns && rows
    raise StandardError, 'Please also provide number of rows' if !rows && columns

    self.image = Matrix.build(rows, columns) { WHITE_COLOUR }
  end

  def clear!
    each_with_index do |_e, row, col|
      image[row, col] = WHITE_COLOUR
    end
  end

  def fill(pixel:, colour:)
    validate_bounds(pixel)

    image[pixel.row - 1, pixel.column - 1] = colour
    self
  end

  def fetch(pixel:)
    validate_bounds(pixel)

    image[pixel.row - 1, pixel.column - 1]
  end

  def to_s
    to_a.map(&:join).join("\n")
  end

  private

  def validate_bounds(pixel)
    raise OutOfBoundError, 'Y co-ordinate is out of bound' if pixel.row > row_size
    raise OutOfBoundError, 'X co-ordinate is out of bound' if pixel.column > column_size
  end
end
