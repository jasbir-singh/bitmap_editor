require './lib/bitmap'

RSpec.describe Bitmap do
  subject do
    Bitmap.new(rows: 2, columns: 2).tap do |image|
      image
        .fill(row: 0, column: 0, colour: 'A')
        .fill(row: 0, column: 1, colour: 'B')
        .fill(row: 1, column: 0, colour: 'C')
        .fill(row: 1, column: 1, colour: 'D')
    end
  end

  describe '#clear!' do
    before { subject.clear! }
    it 'sets each element to zero' do
      subject.each do |elem|
        expect(elem).to be_zero
      end
    end
  end

  describe '#fetch' do
    describe 'it validates the bounds' do
      it 'should raise out of bound error' do
        expect { subject.fetch(row: 3, column: 2) }.to raise_error(Bitmap::OutOfBoundError)
      end

      it 'should raise out of bound error' do
        expect { subject.fetch(row: 2, column: 3) }.to raise_error(Bitmap::OutOfBoundError)
      end
    end

    it 'delgates fetching x, y pixel to Matrix#[]' do
      expect(subject.image).to receive(:[]).with(0, 0)

      subject.fetch(row: 0, column: 0)
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
        expect { subject.fill(row: 3, column: 2, colour: 'W') }.to raise_error(Bitmap::OutOfBoundError)
      end

      it 'should raise out of bound error' do
        expect { subject.fill(row: 2, column: 3, colour: 'W') }.to raise_error(Bitmap::OutOfBoundError)
      end
    end

    it 'delgates setting x, y pixel Matrix#[]=' do
      expect(subject.image).to receive(:[]=).with(0, 0, 'C')

      subject.fill(row: 0, column: 0, colour: 'C')
    end
  end
end
