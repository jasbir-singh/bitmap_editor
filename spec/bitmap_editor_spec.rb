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
      context 'when the input is example1.txt' do
        let(:file_path) { 'spec/fixtures/example1.txt' }
        let(:expected_output) do
          <<~EXAMPLE
            OOOOO
            OOZZZ
            AWOOO
            OWOOO
            OWOOO
            OWOOO
          EXAMPLE
        end

        it 'has the correct output' do
          expect { BitmapEditor.new.run(file_path) }.to output(expected_output).to_stdout
        end
      end

      context 'when the input is example2.txt' do
        let(:file_path) { 'spec/fixtures/example2.txt' }
        let(:expected_output) do
          <<~EXAMPLE
            AB
            CC
            DD
          EXAMPLE
        end

        it 'has the correct output' do
          expect { BitmapEditor.new.run(file_path) }.to output(expected_output).to_stdout
        end
      end

      context 'when the input is example3.txt' do
        let(:file_path) { 'spec/fixtures/example3.txt' }
        let(:expected_output) do
          <<~EXAMPLE
            BDC
            BAC
          EXAMPLE
        end

        it 'has the correct output' do
          expect { BitmapEditor.new.run(file_path) }.to output(expected_output).to_stdout
        end
      end
    end

    context 'with invalid commands' do
      describe 'error_example1.txt' do
        let(:file_path) { 'spec/fixtures/error_example1.txt' }

        it 'outputs an error message' do
          expect do
            BitmapEditor.new.run(file_path)
          end.to output(/X co-ordinate is out of bound/).to_stdout
        end
      end

      describe 'error_example2.txt' do
        let(:file_path) { 'spec/fixtures/error_example2.txt' }

        it 'outputs an error message' do
          expect do
            BitmapEditor.new.run(file_path)
          end.to output(/A is an invalid argument. Please provide a positive integer instead./).to_stdout
        end
      end

      describe 'error_example3.txt' do
        let(:file_path) { 'spec/fixtures/error_example3.txt' }

        it 'outputs an error message' do
          expect do
            BitmapEditor.new.run(file_path)
          end.to output(/X2 has to be greater or equal to X1/).to_stdout
        end
      end

      describe 'error_example4.txt' do
        let(:file_path) { 'spec/fixtures/error_example4.txt' }

        it 'outputs an error message' do
          expect do
            BitmapEditor.new.run(file_path)
          end.to output(/Y2 has to be greater or equal to Y1/).to_stdout
        end
      end

      describe 'error_example5.txt' do
        let(:file_path) { 'spec/fixtures/error_example5.txt' }

        it 'outputs an error message' do
          expect do
            BitmapEditor.new.run(file_path)
          end.to output(/wrong number of arguments/).to_stdout
        end
      end
    end
  end
end
