require_relative '../../lib/bitmap'
require_relative '../../lib/commands/draw_horizontal'

RSpec.describe Commands::DrawHorizontal do
  context 'when X2 is greater then X1' do
    let(:image) { Bitmap.new(rows: 6, columns: 5) }

    before { described_class.new(3, 5, 2, 'Z').execute(image) }

    describe 'inclusivity' do
      it 'draws the pixel at (3, 2)' do
        expect(image.fetch(pixel: Pixel.new(x: 3, y: 2))).to eq('Z')
      end

      it 'draws the pixel at (5, 2)' do
        expect(image.fetch(pixel: Pixel.new(x: 5, y: 2))).to eq('Z')
      end
    end

    it 'fills in the middle pixels ' do
      expect(image.fetch(pixel: Pixel.new(x: 4, y: 2))).to eq('Z')
    end
  end

  context 'when X1(start_row) and X2(end_row) are exactly same' do
    let(:image) { Bitmap.new(rows: 3, columns: 3) }

    before { described_class.new(1, 1, 1, 'W').execute(image) }

    it 'only colours pixel 1, 1' do
      expect(image.fetch(pixel: Pixel.new(x: 1, y: 1))).to eq('W')
    end
  end

  context 'when X1(start_row) is greater then X2(end_row)' do
    let(:image) { Bitmap.new(rows: 3, columns: 3) }

    it 'raises an error' do
      expect do
        described_class.new(2, 1, 1, 'W').execute(image)
      end.to raise_error(/X2 has to be greater or equal to X1/)
    end
  end
end
