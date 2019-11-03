require './lib/bitmap'
require './lib/pixel'

RSpec.describe Bitmap do
  subject do
    Bitmap.new(rows: 2, columns: 2).tap do |image|
      image
        .fill(pixel: Pixel.new(x: 1, y: 1), colour: 'A')
        .fill(pixel: Pixel.new(x: 2, y: 1), colour: 'B')
        .fill(pixel: Pixel.new(x: 1, y: 2), colour: 'C')
        .fill(pixel: Pixel.new(x: 2, y: 2), colour: 'D')
    end
  end

  describe 'delegators' do
    it 'delegates row_size to the @image' do
      expect(subject.image).to receive(:row_size)

      subject.row_size
    end

    it 'delegates column_size to the @image' do
      expect(subject.image).to receive(:column_size)

      subject.column_size
    end

    it 'delegates each_with_index to the @image' do
      expect(subject.image).to receive(:each_with_index)

      subject.each_with_index
    end
  end

  describe 'aliases' do
    it 'aliases image as image!' do
      expect(subject.method(:image)).to eq(subject.method(:image?))
    end
  end

  describe '#create_image' do
    let(:subject) { Bitmap.new }

    context 'when only the rows argument is passed' do
      it 'raises an error' do
        expect { subject.create_image(rows: 2) }.to raise_error(/columns/)
      end
    end

    context 'when only the columns argument is passed' do
      it 'raises an error' do
        expect { subject.create_image(columns: 2) }.to raise_error(/rows/)
      end
    end
  end

  describe '#clear!' do
    before { subject.clear! }

    it 'sets each element to zero' do
      subject.each do |elem|
        expect(elem).to eq(Bitmap::WHITE_COLOUR)
      end
    end
  end

  describe '#fetch' do
    describe 'it validates the bounds' do
      it 'should raise out of bound error' do
        expect do
          subject.fetch(pixel: Pixel.new(x: 3, y: 2))
        end.to raise_error(Bitmap::OutOfBoundError, 'X co-ordinate is out of bound')
      end

      it 'should raise out of bound error' do
        expect do
          subject.fetch(pixel: Pixel.new(x: 2, y: 3))
        end.to raise_error(Bitmap::OutOfBoundError, 'Y co-ordinate is out of bound')
      end
    end

    it 'delgates fetching x, y pixel to Matrix#[]' do
      expect(subject.image).to receive(:[]).with(1, 0)

      subject.fetch(pixel: Pixel.new(x: 1, y: 2))
    end

    describe 'it fetches the right colour' do
      it 'returns A for (1, 1)' do
        expect(subject.fetch(pixel: Pixel.new(x: 1, y: 1))).to eq('A')
      end

      it 'returns B for (2, 1)' do
        expect(subject.fetch(pixel: Pixel.new(x: 2, y: 1))).to eq('B')
      end

      it 'returns C for (1, 2)' do
        expect(subject.fetch(pixel: Pixel.new(x: 1, y: 2))).to eq('C')
      end

      it 'returns D for (2, 2)' do
        expect(subject.fetch(pixel: Pixel.new(x: 2, y: 2))).to eq('D')
      end
    end
  end

  describe '#to_s' do
    context 'with no image being present' do
      subject { Bitmap.new }

      it 'should return empty string' do
        expect(subject.to_s).to be_empty
      end
    end

    it 'returns a representation of the bitmap as a string' do
      expect(subject.to_s).to eq("AB\nCD")
    end
  end

  describe '#fill' do
    describe 'it validates the bounds' do
      it 'should raise out of bound error' do
        expect { subject.fill(pixel: Pixel.new(x: 3, y: 2), colour: 'W') }.to raise_error(Bitmap::OutOfBoundError)
      end

      it 'should raise out of bound error' do
        expect { subject.fill(pixel: Pixel.new(x: 2, y: 3), colour: 'W') }.to raise_error(Bitmap::OutOfBoundError)
      end
    end

    it 'delgates setting x, y pixel Matrix#[]=' do
      expect(subject.image).to receive(:[]=).with(1, 0, 'C')

      subject.fill(pixel: Pixel.new(x: 1, y: 2), colour: 'C')
    end
  end
end
