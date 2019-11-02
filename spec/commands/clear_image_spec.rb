require_relative '../../lib/bitmap'
require_relative '../../lib/commands/clear_image'

RSpec.describe Commands::ClearImage do
  let(:image) do
    Bitmap.new(rows: 2, columns: 2) .tap do |image|
      image.fill(row: 1, column: 1, colour: 'C')
    end
  end

  describe '#execute!' do
    it 'sets all the elements to be zero' do
      expect(image).to receive(:clear!)

      described_class.new.execute!(image)
    end
  end
end
