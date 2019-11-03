require_relative '../lib/command_executor'

RSpec.describe CommandExecutor do
  describe '.execute' do
    context 'when the command is not found' do
      it 'returns the error message' do
        expect { CommandExecutor.new('I_DONT_EXIST').execute(nil) }.to output(/Unrecognised command/).to_stdout
      end
    end
  end
end
