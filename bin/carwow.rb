# There are 6 supported commands:
#   I N M - Create a new M x N image with all pixels coloured white (O).
#   C - Clears the table, setting all pixels to white (O).
#   L X Y C - Colours the pixel (X,Y) with colour C.
#   V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
#   H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
#   S - Show the contents of the current image

class CreateImageCommand
end

class ClearImageCommand
end

class ColourPixelCommand
end

class DrawVerticalCommand
end

class DrawHorizontalCommand
end

class ShowImageCommand
end

class CommandExecutor
  def initialize(command)
  end

  def execute!
  end
end
