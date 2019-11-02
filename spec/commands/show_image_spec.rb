require_relative '../../lib/bitmap'
require_relative '../../lib/commands/show_image'

RSpec.describe Commands::ShowImage do
  let(:image) { Bitmap[[1, 2], [3, 4]] }

  describe '#execute!' do
    it 'prints out image' do
      expect { described_class.new.execute!(image) }.to output("12\n34\n").to_stdout
    end
  end
end
