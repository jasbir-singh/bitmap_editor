require './lib/numeric'
require './lib/pixel'

RSpec.describe Pixel do
  let(:pixel) { described_class.new(x: 1, y: 2) }

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

  describe 'aliases' do
    it 'aliases row as y' do
      expect(pixel.method(:row)).to eq(pixel.method(:y))
    end

    it 'aliases column as x' do
      expect(pixel.method(:column)).to eq(pixel.method(:x))
    end
  end
end
