require_relative '../../lib/pixel'
require_relative '../../lib/bitmap'
require_relative '../../lib/commands/draw_vertical'

RSpec.describe Commands::DrawVertical do
  let(:image) { Bitmap.new(rows: 6, columns: 5) }

  before { described_class.new(2, 3, 6, 'W').execute(image) }

  describe 'inclusivity' do
    it 'draws the pixel at 2,3' do
      expect(image.fetch(pixel: Pixel.new(x: 2, y: 3))).to eq('W')
    end

    it 'draws the pixel at 2,6' do
      expect(image.fetch(pixel: Pixel.new(x: 2, y: 6))).to eq('W')
    end
  end

  describe 'it draws the pixels in the middle' do
    it 'draws at (2, 4)' do
      expect(image.fetch(pixel: Pixel.new(x: 2, y: 4))).to eq('W')
    end
    it 'draws at (2, 5)' do
      expect(image.fetch(pixel: Pixel.new(x: 2, y: 5))).to eq('W')
    end
    it 'draws at (2, 6)' do
      expect(image.fetch(pixel: Pixel.new(x: 2, y: 6))).to eq('W')
    end
  end
end
