require 'matrix'
# There are 6 supported commands:
#   I N M - Create a new M x N image with all pixels coloured white (O).
#   C - Clears the table, setting all pixels to white (O).
#   L X Y C - Colours the pixel (X,Y) with colour C.
#   V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
#   H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
#   S - Show the contents of the current image

class CreateImageCommand
  attr_reader :rows, :columns

  def initialize(rows, columns)
    @rows = rows.to_i
    @columns = columns.to_i
  end

  def execute!
    Matrix.build(rows, columns) { 0 }
  end
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
  COMMAND_MAPPINGS = {
    'I' => CreateImageCommand,
  }

  attr_reader :command

  def initialize(command, *args)
    @command = COMMAND_MAPPINGS[command].new(*args)
  end

  def execute!
    command.execute!
  end
end
