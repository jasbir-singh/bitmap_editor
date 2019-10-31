class Commands::ClearImage
  def execute!(image)
    image.each_with_index do |e, row, col|
      image[row, col] = 0
    end
  end
end
