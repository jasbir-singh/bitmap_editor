require 'rspec'
require 'pry'
require '../bin/carwow'

RSpec.describe CommandExecutor do
  describe '.execute!' do
    context 'create image command' do
      subject { CommandExecutor.new('I', '5', '6').execute! }

      it 'returns the resulting matrix' do
        expect(subject).to be_a_kind_of(Matrix)
      end
    end
  end
end
