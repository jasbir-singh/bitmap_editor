module Commands
  class InvalidArgumentError  < StandardError
    attr_reader :error_coordinate

    def initialize(error_coordinate)
      @error_coordinate = error_coordinate
      super(formatted_error)
    end

    private

    def formatted_error
      "#{error_coordinate}2 has to be greater or equal to #{error_coordinate}1"
    end
  end
end
