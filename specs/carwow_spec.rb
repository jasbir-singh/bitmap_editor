require 'rspec'
require 'pry'
require_relative '../bin/carwow'

RSpec.describe CommandExecutor do
  let(:image) { CommandExecutor.new('I', '5', '6').execute! }

  describe '.execute!' do
    context 'create image command' do
      subject { image }

      it 'returns the resulting matrix' do
        expect(subject).to be_a_kind_of(Matrix)
      end

      it 'has 6 rows' do
        expect(subject.row_size).to eq(6)
      end

      it 'has 5 columns' do
        expect(subject.column_size).to eq(5)
      end
    end

    context 'colouring pixel command' do
      subject { CommandExecutor.new('L', '1', '3', 'A').execute!(image) }

      it 'updates the corresponding pixel' do
        expect(subject[2, 0]).to eq('A')
      end
    end
  end
end
