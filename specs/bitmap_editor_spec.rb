require 'rspec'
require './lib/bitmap_editor'

RSpec.describe BitmapEditor do
  describe '#run' do
    let(:file_path) { 'examples/show.txt' }

    context 'when the input is a file' do
      it 'runs the commands' do
        expect { BitmapEditor.new.run(file_path) }.to output(/00ZZZ/).to_stdout
      end

      it 'runs the commands' do
        expect { BitmapEditor.new.run(file_path) }.to output(/AW000/).to_stdout
      end
    end
  end
end
