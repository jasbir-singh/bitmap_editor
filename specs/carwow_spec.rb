require 'rspec'
require 'pry'
require_relative '../bin/carwow'

RSpec.describe CommandExecutor do
  let(:image) { Matrix.build(4,4) { 0 } }

  describe '.execute!' do
    context 'create image command' do
      subject { CommandExecutor.new('I', '5', '6').execute! }

      it 'returns the resulting matrix' do
        expect(subject).to be_a_kind_of(Matrix)
      end
    end

    context 'colouring pixel command' do
      subject { CommandExecutor.new('L', '1', '3', 'A').execute!(image) }

      it 'updates the corresponding pixel', wip: true do
        expect(subject[1, 3]).to eq('A')
      end
    end
  end
end
