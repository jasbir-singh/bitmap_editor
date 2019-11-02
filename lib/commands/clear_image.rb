module Commands
  class ClearImage
    def execute!(image)
      image.each_with_index do |_e, row, col|
        image[row, col] = 0
      end
    end
  end
end
