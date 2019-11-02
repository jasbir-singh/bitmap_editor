require './lib/command_executor'

class BitmapEditor
  def run(file_path)
    repl unless file_path

    return puts 'Please provide correct file' unless File.exist?(file_path)

    run_commands_from_file(file_path) if file_path
  end

  private

  def run_commands_from_file(file_path)
    # TODO: Handle the case when the file doesn't exist
    IO.foreach(file_path) do |line|
      @current_bitmap = CommandExecutor.new(*line_to_command(line)).execute!(@current_bitmap)
    end
  end

  def line_to_command(line)
    line.split(' ')
  end

  def repl
    loop do
      print('> ')
      input = gets.chomp
      @current_bitmap = CommandExecutor.new(*line_to_command(input)).execute!(@current_bitmap)
      CommandExecutor.new('S').execute!(@current_bitmap)
    end
  end
end

BitmapEditor.new.run ARGV[0] if $PROGRAM_NAME == __FILE__
