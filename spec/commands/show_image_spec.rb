require_relative '../../lib/pixel'
require_relative '../../lib/bitmap'
require_relative '../../lib/commands/show_image'

RSpec.describe Commands::ShowImage do
  describe '#execute' do
    context 'with no image' do
      let(:image) {}

      it 'returns error message' do
        expect { described_class.new.execute(image) }.to output(/There is no image/).to_stdout
      end
    end

    context 'with valid image' do
      let(:image) do
        Bitmap.new(rows: 2, columns: 2).tap do |image|
          image
            .fill(pixel: Pixel.new(x: 1, y: 1), colour: 'A')
            .fill(pixel: Pixel.new(x: 2, y: 1), colour: 'B')
            .fill(pixel: Pixel.new(x: 1, y: 2), colour: 'C')
            .fill(pixel: Pixel.new(x: 2, y: 2), colour: 'D')
        end
      end

      it 'prints out image' do
        expect { described_class.new.execute(image) }.to output("AB\nCD\n").to_stdout
      end
    end
  end
end
