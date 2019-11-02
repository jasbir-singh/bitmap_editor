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
      describe 'example1' do
        let(:file_path) { 'spec/fixtures/example1.txt' }
        let(:expected_output) do
          <<~EOF
          OOOOO
          OOZZZ
          AWOOO
          OWOOO
          OWOOO
          OWOOO
        EOF
        end

        it 'has the correct output' do
          expect { BitmapEditor.new.run(file_path) }.to output(expected_output).to_stdout
        end
      end
    end
  end
end
