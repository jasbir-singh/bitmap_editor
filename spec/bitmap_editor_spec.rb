require 'rspec'
require './lib/bitmap_editor'

RSpec.describe BitmapEditor do
  describe '#run' do
    context "when the file doesn't exist" do
      let(:file_path) { 'i/definitely/dont/exist' }

      it 'returns an error message' do
        expect { BitmapEditor.new.run(file_path) }.to output(/doesn't exist/).to_stdout
      end
    end

    context 'when the input is a valid file' do
      let(:file_path) { 'examples/show.txt' }

      it 'runs the commands' do
        expect { BitmapEditor.new.run(file_path) }.to output(/00ZZZ/).to_stdout
      end

      it 'runs the commands' do
        expect { BitmapEditor.new.run(file_path) }.to output(/AW000/).to_stdout
      end
    end
  end
end
