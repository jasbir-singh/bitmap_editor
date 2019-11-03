class Numeric
  def self.parse_positive_integer(input)
    begin
      output = Integer(input)
    rescue ArgumentError
      raise StandardError, "#{input} is invalid. Please provide a positive integer instead."
    end

    raise StandardError, "#{input} is invalid. Please provide a positive integer instead." if output.negative?

    output
  end
end
