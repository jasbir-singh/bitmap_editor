require_relative '../../lib/bitmap'
require_relative '../../lib/commands/create_image'

RSpec.describe Commands::CreateImage do
  describe '#execute!' do
    subject { described_class.new(5, 6).execute! }

    it 'creates a new image of type Bitmap' do
      expect(subject).to be_a(Bitmap)
    end

    it 'has right number of rows' do
      expect(subject.row_size).to eq(6)
    end

    it 'has the right number of columns' do
      expect(subject.column_size).to eq(5)
    end
  end
end
