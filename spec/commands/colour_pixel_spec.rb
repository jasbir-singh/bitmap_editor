require_relative '../../lib/bitmap'
require_relative '../../lib/commands/colour_pixel'

RSpec.describe Commands::ColourPixel do
  let(:image) { Bitmap.zero(2) }

  describe '#execute!' do
    context 'pixel are invalid', wip: true do
      it 'should raise out of bound error' do
        expect { described_class.new(3, 2, 'W').execute!(image) }.to raise_error(Bitmap::OutOfBoundError)
      end

      it 'should raise out of bound error' do
        expect { described_class.new(2, 3, 'W').execute!(image) }.to raise_error(Bitmap::OutOfBoundError)
      end
    end

    context 'with valid pixels' do
      subject { described_class.new(1, 1, 'W').execute!(image) }

      it 'colours the right pixel' do
        expect(subject[0, 0]).to eq('W')
      end
    end
  end
end
