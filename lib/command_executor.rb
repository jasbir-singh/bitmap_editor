require './lib/commands/create_image'
require './lib/commands/clear_image'
require './lib/commands/colour_pixel'
require './lib/commands/draw_vertical'
require './lib/commands/draw_horizontal'
require './lib/commands/show_image'

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
