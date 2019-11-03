class Numeric
  class InvalidIntegerError < StandardError
    def initialize(input:)
      super(formatted_error(input))
    end

    private

    def formatted_error(input)
      "#{input} is invalid. Please provide a positive integer instead."
    end
  end

  def self.parse_positive_integer(input)
    begin
      output = Integer(input)
    rescue ArgumentError
      raise InvalidIntegerError.new(input: input)
    end
    raise InvalidIntegerError.new(input: input) if output.negative?

    output
  end
end
