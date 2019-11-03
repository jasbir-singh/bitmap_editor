module Commands
  class ClearImage
    def execute!(bitmap)
      bitmap.clear!
    end
  end
end
