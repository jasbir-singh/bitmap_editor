require_relative '../../lib/bitmap'
require_relative '../../lib/commands/colour_pixel'

RSpec.describe Commands::ColourPixel do
  let(:image) { Bitmap.zero(2) }

  describe '#execute!' do
    it 'calls Bitmap#fill method with the right arguments' do
      expect(image).to receive(:fill).with(row: 0, column: 0, colour: 'W')

      described_class.new(1, 1, 'W').execute!(image)
    end
  end
end
