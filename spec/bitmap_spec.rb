require './lib/bitmap'

RSpec.describe Bitmap do
  subject { Bitmap.new(rows: 2, columns: 2) }

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
