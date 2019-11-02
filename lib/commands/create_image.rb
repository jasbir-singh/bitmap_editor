require './lib/bitmap'

module Commands
  class CreateImage
    attr_reader :rows, :columns

    def initialize(columns, rows)
      @rows = rows.to_i
      @columns = columns.to_i
    end

    def execute!(_ = nil)
      Bitmap.new(rows: rows, columns: columns)
    end
  end
end
