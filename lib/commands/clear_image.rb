module Commands
  class ClearImage
    def execute!(image)
      image.clear!
    end
  end
end
