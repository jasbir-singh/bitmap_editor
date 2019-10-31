require './bin/commands/create_image'
require './bin/commands/clear_image'
require './bin/commands/colour_pixel'
require './bin/commands/draw_vertical'
require './bin/commands/draw_horizontal'
require './bin/commands/show_image'

class CommandExecutor
  COMMAND_MAPPINGS = {
    'I' => Commands::CreateImage,
    'C' => Commands::ClearImage,
    'L' => Commands::ColourPixel,
    'V' => Commands::DrawVertical,
    'H' => Commands::DrawHorizontal,
    'S' => Commands::ShowImage
  }.freeze

  attr_reader :command

  def initialize(command, *args)
    @command = COMMAND_MAPPINGS[command].new(*args)
  end

  def execute!(*args)
    command.execute!(*args)
  end
end

class BitmapEditor
  def run
    loop do
      print("> ")
      input = gets.chomp
      @bitmap = CommandExecutor.new(*input.split(' ')).execute!(@bitmap)
      CommandExecutor.new('S').execute!(@bitmap)
    end
  end
end

if __FILE__ == $0
  BitmapEditor.new.run
end
