require_relative '../../lib/bitmap'
require_relative '../../lib/commands/draw_horizontal'

RSpec.describe Commands::DrawHorizontal do
  let(:image) { Bitmap.new(rows: 6, columns: 5) }

  before { described_class.new(3, 5, 2, 'Z').execute!(image) }

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
