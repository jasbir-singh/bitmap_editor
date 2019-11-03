module Commands
  class ShowImage
    def execute!(bitmap)
      return no_bitmap unless bitmap&.image?

      puts bitmap
    end

    private

    def no_bitmap
      puts 'There is no image'
    end
  end
end
