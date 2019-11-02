require './bin/command_executor'

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
