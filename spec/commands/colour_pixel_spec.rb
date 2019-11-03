require_relative '../../lib/pixel'
require_relative '../../lib/bitmap'
require_relative '../../lib/commands/colour_pixel'

RSpec.describe Commands::ColourPixel do
  let(:image) { Bitmap.new(rows: 2, columns: 2) }

  context "when the co-ordinates can't be parsed" do
    it 'raises an error' do
      expect do
        described_class.new('A', 'B', 'W').execute(image)
      end.to raise_error(/a positive integer/)
    end
  end

  describe '#execute' do
    it 'calls Bitmap#fill method with the right arguments' do
      expect(image).to receive(:fill).with(pixel: instance_of(Pixel), colour: 'W')

      described_class.new(1, 1, 'W').execute(image)
    end
  end
end
