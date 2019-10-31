class Commands::ShowImage
  def execute!(image)
    image.to_a.each { |row| pp row }
  end
end
