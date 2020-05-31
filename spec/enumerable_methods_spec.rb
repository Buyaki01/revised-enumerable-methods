require './enumerable_methods.rb'

RSpec.describe Enumerable do
    let(:b) { [1, 3, 5, 7] }
    let(:c) { [1, 2, 4, 2] }
    let(:d) { ["ant", "bear", "cat"] } 

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

    describe '#my_select' do
      it 'if no block is given, it should return enumerator' do
        expect(b.my_select).to be_a(Enumerator)
      end

      it 'Should return even numbers if a block is given' do
        expect(c.my_select(&:even?)).to eql([2,4,2])
      end

      it 'Should return odd numbers if a block is given' do
        expect(b.my_select(&:odd?)).to eql([1,3,5,7])
      end

      it 'Should return words with the required length' do
        expect(d.my_select { |word| word.length == 3 }).to eq(["ant", "cat"])
      end
    end
end
