class Numeric
  class InvalidIntegerError < StandardError
    attr_reader :input

    def initialize(input)
      @input = input

      super(formatted_error)
    end

    private

    def formatted_error
      "#{input} is an invalid argument. Please provide a positive integer instead."
    end
  end

  def self.parse_positive_integer(input)
    begin
      output = Integer(input)
    rescue ArgumentError
      raise InvalidIntegerError, input
    end
    raise InvalidIntegerError, input if output.negative?

    output
  end
end
