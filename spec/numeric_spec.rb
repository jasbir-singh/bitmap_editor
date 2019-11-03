require './lib/numeric'

RSpec.describe Numeric do
  describe '.parse_positive_integer' do
    context 'when the input is un-parseable as an Integer' do
      it 'raises an error' do
        expect do
          described_class.parse_positive_integer('A')
        end.to raise_error(/positive integer/)
      end
    end

    context 'when the input provided is negative' do
      it 'raises an error' do
        expect do
          described_class.parse_positive_integer('-1')
        end.to raise_error(/positive integer/)
      end
    end

    context 'when the input provided is valid' do
      let(:result) { described_class.parse_positive_integer('1') }

      it 'returns the value' do
        expect(result).to eq(1)
      end

      it 'is an instance of Integer' do
        expect(result).to be_a(Integer)
      end
    end
  end
end
