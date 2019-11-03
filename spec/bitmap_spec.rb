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

  describe 'filling' do
    it 'works' do
      expect(subject.fetch(pixel: Pixel.new(x: 1, y: 1))).to eq('A')
      expect(subject.fetch(pixel: Pixel.new(x: 2, y: 1))).to eq('B')
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
        expect { subject.fetch(pixel: Pixel.new(x: 3, y: 2)) }.to raise_error(Bitmap::OutOfBoundError)
      end

      it 'should raise out of bound error' do
        expect { subject.fetch(pixel: Pixel.new(x: 2, y: 3)) }.to raise_error(Bitmap::OutOfBoundError)
      end
    end

    it 'delgates fetching x, y pixel to Matrix#[]' do
      expect(subject.image).to receive(:[]).with(1, 0)

      subject.fetch(pixel: Pixel.new(x: 1, y: 2))
    end
  end

  describe '#to_s' do
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
