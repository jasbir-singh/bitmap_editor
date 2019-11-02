require_relative '../lib/command_executor'

RSpec.describe CommandExecutor do
  let(:image) { CommandExecutor.new('I', '5', '6').execute! }

  describe '.execute!' do
  end
end
