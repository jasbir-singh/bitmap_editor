class Pixel
  attr_reader :x, :y
  include Comparable

  def initialize(x:, y:)
    @x = x.to_i
    @y = y.to_i
  end

  def to_s
    "(#{x}, #{y})"
  end

  alias row y
  alias column x
end
