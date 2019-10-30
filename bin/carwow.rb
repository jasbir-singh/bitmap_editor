# frozen_string_literal: true

require 'matrix'
require 'pry'

class CreateImageCommand
  attr_reader :rows, :columns

  def initialize(columns, rows)
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
  attr_reader :row, :column, :colour

  def initialize(row, column, colour)
    @row = row.to_i
    @column = column.to_i
    @colour = colour
  end

  def execute!(image)
    image[row, column] = colour
  end
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
    'L' => ColourPixelCommand
  }.freeze

  attr_reader :command

  def initialize(command, *args)
    @command = COMMAND_MAPPINGS[command].new(*args)
  end

  def execute!(*args)
    command.execute!(*args)
  end
end
