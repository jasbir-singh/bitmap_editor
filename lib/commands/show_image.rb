module Commands
  class ShowImage
    def execute!(image)
      image.to_a.each { |row| puts row.join }
    end
  end
end
