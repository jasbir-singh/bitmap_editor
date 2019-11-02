require_relative '../../lib/bitmap'
require_relative '../../lib/commands/draw_horizontal'

RSpec.describe Commands::DrawHorizontal do
  let(:image) { Bitmap.zero(6, 5) }

  subject { described_class.new(3, 5, 2, 'Z').execute!(image) }

  describe 'inclusivity' do
    # TODO: change these tests so that they only
    # verify that fill is getting called with the right arguments

    it 'draws the pixel at 2,3' do
      expect(subject[1, 3]).to eq('Z')
    end

    it 'draws the pixel at 2,6' do
      expect(subject[1, 4]).to eq('Z')
    end
  end

  it 'draws a vertical segment of colour C ' do
    expect(subject[1, 3]).to eq('Z')
  end
end
