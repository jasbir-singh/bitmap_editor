require_relative '../../lib/bitmap'
require_relative '../../lib/commands/show_image'

RSpec.describe Commands::ShowImage do
  describe '#execute!' do
    context 'with no image' do
      let(:image) { }

      it 'returns error message' do
        expect { described_class.new.execute!(image) }.to output(/There is no image/).to_stdout
      end
    end

    context 'with valid image' do
      let(:image) { Bitmap[[1, 2], [3, 4]] }
      it 'prints out image' do
        expect { described_class.new.execute!(image) }.to output("12\n34\n").to_stdout
      end
    end
  end
end
