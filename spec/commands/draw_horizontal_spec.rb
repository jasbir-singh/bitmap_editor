require_relative '../../lib/bitmap'
require_relative '../../lib/commands/draw_horizontal'

RSpec.describe Commands::DrawHorizontal do
  context 'with valid input' do
    let(:image) { Bitmap.zero(6, 5) }

    subject { described_class.new(3, 5, 2, 'Z').execute!(image) }

    describe 'inclusivity' do
      it 'draws the pixel at 2,3' do
        expect(subject[1, 3]).to eq('Z')
      end

      it 'draws the pixel at 2,6' do
        expect(subject[1, 4]).to eq('Z')
      end
    end

    it 'draws a vertical segment of colour C ' do
      expect(subject[1, 3]).to eq('Z')
    end
  end

  context 'with invalid input' do
    let(:image) { Bitmap.zero(2) }

    it 'should raise an error' do
      expect { described_class.new(1, 3, 2, 'W').execute!(image) }.to raise_error(Bitmap::OutOfBoundError)
    end
  end
end
