require 'forwardable'
require 'matrix'

class Bitmap
  class OutOfBoundError < StandardError
  end
  extend Forwardable

  def_delegators :@image, :row_size, :column_size, :each_with_index, :each, :to_a

  attr_accessor :image

  def initialize(rows:, columns:)
    @image = Matrix.zero(rows, columns)
  end

  def clear!
    each_with_index do |_e, row, col|
      image[row, col] = 0
    end
  end

  def fill(row:, column:, colour:)
    validate_bounds(row, column)

    image[row, column] = colour
    self
  end

  def fetch(row:, column:)
    validate_bounds(row, column)

    image[row, column]
  end

  private

  def validate_bounds(row, column)
    raise OutOfBoundError if row >= row_size || column >= column_size
  end
end
