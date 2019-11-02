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
      let(:image) do
        Bitmap.new(rows: 2, columns: 2).tap do |image|
          image
            .fill(row: 0, column: 0, colour: 'A')
            .fill(row: 0, column: 1, colour: 'B')
            .fill(row: 1, column: 0, colour: 'C')
            .fill(row: 1, column: 1, colour: 'D')
        end
      end

      it 'prints out image' do
        expect { described_class.new.execute!(image) }.to output("AB\nCD\n").to_stdout
      end
    end
  end
end
