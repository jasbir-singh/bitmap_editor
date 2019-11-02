require 'matrix'
require_relative '../../lib/commands/clear_image'

RSpec.describe Commands::ClearImage do
  let(:image) { Matrix[[1, 2], [3, 4]] }

  describe '#execute!' do
    subject { described_class.new.execute!(image) }

    it 'sets all the elements to be zero' do
      subject.each do |elem|
        expect(elem).to be_zero
      end
    end
  end
end
