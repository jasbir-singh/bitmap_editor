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
  def execute!(image)
    image.each_with_index do |e, row, col|
      image[row, col] = 0
    end
  end
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
  attr_reader :column1, :column2, :row, :colour

  def initialize(column1, column2, row, colour)
    @column1 = column1 - 1
    @column2 = column2 - 1
    @row = row - 1
    @colour = colour
  end

  def execute!(image)
    (column1..column2).each do |column|
      image[row, column] = colour
    end
    image
  end
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
