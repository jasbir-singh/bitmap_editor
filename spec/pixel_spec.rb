require './lib/numeric'
require './lib/pixel'

RSpec.describe Pixel do
  let(:pixel) do
    described_class.new(x: 1, y: 2)
  end

  describe 'initialiser' do
    it 'calls uses Numeric class to parse on (x, y) co-ordinates' do
      expect(Numeric).to receive(:parse_positive_integer).with('A')
      expect(Numeric).to receive(:parse_positive_integer).with('B')

      described_class.new(x: 'A', y: 'B')
    end

    it 'sets the accessor x' do
      expect(pixel.x).to eq(1)
    end

    it 'sets the accessor y' do
      expect(pixel.y).to eq(2)
    end
  end
end
