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
    Matrix.zero(rows, columns)
  end
end

class ClearImageCommand
end

class ColourPixelCommand
  attr_reader :row, :column, :colour

  def initialize(column, row, colour)
    # TODO: Handle the case where rows, columns are out of bound
    @row = row.to_i - 1
    @column = column.to_i - 1
    @colour = colour
  end

  def execute!(image)
    image[row, column] = colour
    image
  end
end

class DrawVerticalCommand
  attr_reader :column, :row1, :row2, :colour

  def initialize(column, row1, row2, colour)
    @column = column - 1
    @row1 = row1 - 1
    @row2 = row2 - 1
    @colour = colour
  end

  def execute!(image)
    (row1..row2).each do |row|
      image[row, column] = colour
    end
    image
  end
end

class DrawHorizontalCommand
end

class ShowImageCommand
end

class CommandExecutor
  COMMAND_MAPPINGS = {
    'I' => CreateImageCommand,
    'C' => ClearImageCommand,
    'L' => ColourPixelCommand,
    'V' => DrawVerticalCommand,
    'H' => DrawHorizontalCommand,
    'S' => ShowImageCommand
  }.freeze

  attr_reader :command

  def initialize(command, *args)
    @command = COMMAND_MAPPINGS[command].new(*args)
  end

  def execute!(*args)
    command.execute!(*args)
  end
end
