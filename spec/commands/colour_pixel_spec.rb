require 'matrix'
require_relative '../../lib/commands/colour_pixel'

RSpec.describe Commands::ColourPixel do
  let(:image) { Matrix.zero(2) }

  describe '#execute' do
    subject { described_class.new(1, 1, 'W').execute!(image) }

    it 'colours the right pixel', wip: true do
      expect(subject[0,0]).to eq('W')
    end
  end
end
