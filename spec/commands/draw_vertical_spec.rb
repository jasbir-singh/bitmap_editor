require_relative '../../lib/bitmap'
require_relative '../../lib/commands/draw_vertical'

RSpec.describe Commands::DrawVertical do
  context 'with valid input' do
    let(:image) { Bitmap.zero(6, 5) }

    subject { described_class.new(2, 3, 6, 'W').execute!(image) }

    describe 'inclusivity' do
      it 'draws the pixel at 2,3' do
        expect(subject[2, 1]).to eq('W')
      end

      it 'draws the pixel at 2,6' do
        expect(subject[5, 1]).to eq('W')
      end
    end

    it 'draws a vertical segment of colour C ' do
      expect(subject[3, 1]).to eq('W')
      expect(subject[4, 1]).to eq('W')
    end
  end

  context 'with invalid input' do
    let(:image) { Bitmap.zero(2) }

    it 'should raise an error' do
      expect { described_class.new(2, 1, 3, 'W').execute!(image) }.to raise_error(Bitmap::OutOfBoundError)
    end
  end
end
