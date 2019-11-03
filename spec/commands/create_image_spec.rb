require_relative '../../lib/bitmap'
require_relative '../../lib/commands/create_image'

RSpec.describe Commands::CreateImage do
  let(:bitmap) { Bitmap.new }

  describe '#execute' do
    before { described_class.new(5, 6).execute(bitmap) }

    it "initializes the bitmap's size" do
      expect(bitmap.image).to_not be_nil
    end

    it 'creates the rows with the right number of rows' do
      expect(bitmap.row_size).to eq(6)
    end

    it 'creates the rows with the right number of columns' do
      expect(bitmap.column_size).to eq(5)
    end
  end
end
