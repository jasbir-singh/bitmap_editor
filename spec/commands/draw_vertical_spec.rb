require 'matrix'
require_relative '../../bin/commands/draw_vertical'

RSpec.describe Commands::DrawVertical do
  let(:image) { Matrix.zero(6, 5) }

  context 'draw vertical command' do
    subject { described_class.new(2, 3, 6, 'W').execute!(image) }

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
end
