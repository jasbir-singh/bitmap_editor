require './lib/numeric'

# rubocop:disable Naming/UncommunicativeMethodParamName
class Pixel
  # NOTE: Usually I wouldn't use such short method/variable names.
  #       However, in this context I think they make sense.
  attr_reader :x, :y

  def initialize(x:, y:)
    @x = Numeric.parse_positive_integer(x)
    @y = Numeric.parse_positive_integer(y)
  end

  def to_s
    "(#{x}, #{y})"
  end

  alias row y
  alias column x
end
# rubocop:enable Naming/UncommunicativeMethodParamName
