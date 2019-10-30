require 'rspec'
require 'pry'
require_relative '../bin/carwow'

RSpec.describe CommandExecutor do
  let(:image) { CommandExecutor.new('I', '5', '6').execute! }

  describe '.execute!' do
    context 'create image command' do
      subject { image }

      it 'returns the resulting matrix' do
        expect(subject).to be_a_kind_of(Matrix)
      end

      it 'has 6 rows' do
        expect(subject.row_size).to eq(6)
      end

      it 'has 5 columns' do
        expect(subject.column_size).to eq(5)
      end
    end

    context 'draw vertical command' do
      subject { CommandExecutor.new('V', 2, 3, 6, 'W').execute!(image) }

      describe 'inclusivity' do
        it 'draws the pixel at 2,3' do
          expect(subject[2, 1]).to eq('W')
        end

        it 'draws the pixel at 2,6' do
          expect(subject[5, 1]).to eq('W')
        end
      end

      it 'draws a vertical segment of colour C ' do
        expect(subject[3, 1]).to eq('W')
        expect(subject[4, 1]).to eq('W')
      end
    end

    context 'clear image command' do
      let(:image) { Matrix.build(4, 4) { 1 } }
      subject { CommandExecutor.new('C').execute!(image) }

      it 'clears the image' do
        expect(subject[0, 0]).to eq(0)
      end
    end

    context 'colouring pixel command' do
      subject { CommandExecutor.new('L', '1', '3', 'A').execute!(image) }

      it 'updates the corresponding pixel' do
        expect(subject[2, 0]).to eq('A')
      end
    end
  end
end
