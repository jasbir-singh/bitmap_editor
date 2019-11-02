module Commands
  class ShowImage
    def execute!(image)
      return no_image unless image

      image.to_a.each { |row| puts row.join }
    end

    private

    def no_image
      puts 'There is no image'
    end
  end
end
