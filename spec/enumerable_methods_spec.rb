require './enumerable_methods.rb'

RSpec.describe Enumerable do
    let(:b) { [1, 3, 5, 7] }
    let(:c) { [1, 2, 4, 2] }
    let(:d) { %w[(ant bear cat)] } 

    describe '#my_each' do
      it 'if no block is given, it should return enumerator' do
        expect(b.my_each).to be_a(Enumerator)
      end

      it 'if an array is given, it should return an array' do
        expect(b.my_each {|i| i}).to eql(b)
      end
    end

    describe '#my_each_with_index' do
      it 'if no block is given, it should return enumerator' do
        expect(d.my_each).to be_a(Enumerator)
      end

      it 'Should return i and j if block is given' do
        hash = {}
        expect(d.my_each_with_index {|i,j| hash[i] = j }).to eql(d)
      end
    end
end
