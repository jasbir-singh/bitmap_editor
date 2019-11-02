require_relative '../../lib/bitmap'
require_relative '../../lib/commands/clear_image'

RSpec.describe Commands::ClearImage do
  let(:image) do
    Bitmap.new(rows: 2, columns: 2) .tap do |image|
      image.fill(row: 1, column: 1, colour: 'C')
    end
  end

  describe '#execute!' do
    subject { described_class.new.execute!(image) }

    xit 'sets all the elements to be zero' do
      subject.each do |elem|
        expect(elem).to be_zero
      end
    end
  end
end
