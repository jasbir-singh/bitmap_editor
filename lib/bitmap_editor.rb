require './lib/command_executor'

class BitmapEditor
  def run(file_path)
    repl unless file_path

    run_commands_from_file(file_path)
  end

  private

  def run_commands_from_file(file_path)
    return puts "File doesn't exist" unless File.exist?(file_path)

    IO.foreach(file_path) do |line|
      @current_bitmap = CommandExecutor.new(*line_to_command(line)).execute!(@current_bitmap)
    end
  rescue StandardError => e
    puts "Error occured: #{e.message}"
  end

  def line_to_command(line)
    line.split(' ')
  end

  def repl
    loop do
      print('> ')
      input = gets&.chomp
      exit unless input

      @current_bitmap = CommandExecutor.new(*line_to_command(input)).execute!(@current_bitmap)
    rescue StandardError => e
      puts "Error occured: #{e.message}"
    end
  end
end

BitmapEditor.new.run ARGV[0] if $PROGRAM_NAME == __FILE__
