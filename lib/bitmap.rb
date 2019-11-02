require 'matrix'

class Bitmap < Matrix
  class OutOfBoundError < StandardError
  end

  def fill(row:, column:, colour:)
    validate_bounds(row, column)

    self[row, column] = colour
  end

  def fetch(row:, column:)
    validate_bounds(row, column)

    self[row, column]
  end

  private

  def validate_bounds(row, column)
    raise OutOfBoundError if row >= row_size || column >= column_size
  end
end
