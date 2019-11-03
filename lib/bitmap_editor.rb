require './lib/command_executor'

class BitmapEditor
  attr_accessor :current_bitmap

  def initialize
    self.current_bitmap = Bitmap.new
  end

  def run(file_path)
    repl unless file_path

    run_commands_from_file(file_path)
  end

  private

  def run_commands_from_file(file_path)
    return puts "File doesn't exist" unless File.exist?(file_path)

    IO.foreach(file_path) { |line| execute_command(line) }
  rescue StandardError => e
    handle_error(e)
  end

  def repl
    loop do
      print('> ')
      input = gets&.chomp
      exit unless input

      execute_command(input)
    rescue StandardError => e
      handle_error(e)
    end
  end

  def execute_command(input)
    CommandExecutor.new(*input.split(' ')).execute!(current_bitmap)
  end

  def handle_error(error)
    puts "Error occured: #{error.message}"
  end
end

BitmapEditor.new.run ARGV[0] if $PROGRAM_NAME == __FILE__
