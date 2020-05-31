require './enumerable_methods.rb'

RSpec.describe Enumerable do
    let(:b) { [1, 3, 5, 7] }
    let(:c) { [1, 2, 4, 2] }
    let(:d) { ["ant", "bear", "cat"] } 
    let(:e) { [nil, true, 99] }
    let(:f) { [1, 2, 3, 4, 'cool'] }

    describe '#my_each' do
      it 'should return enumerator if no block is given' do
        expect(b.my_each).to be_a(Enumerator)
      end

      it 'should return an array if an array is given' do
        expect(b.my_each {|i| i}).to eql(b)
      end
    end

    describe '#my_each_with_index' do
      it 'should return enumerator if no block is given' do
        expect(d.my_each).to be_a(Enumerator)
      end

      it 'Should return i and j if block is given' do
        hash = {}
        expect(d.my_each_with_index {|i,j| hash[i] = j }).to eql(d)
      end
    end

    describe '#my_select' do
      it 'should return enumerator if no block is given' do
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

    describe '#my_all?' do
      it 'should return true if no argument and block is given' do
        expect([].my_all?).to eql(true)
      end

      it 'should return false if argument is given and block is not given' do
        expect(e.my_all?).to eql(false)
      end

      it 'should return true if all the elements in the argument are Numeric is given and block is given' do
        expect(b.my_all?(Numeric)).to eql(true)
      end

      it 'should return false if all the elements in the argument are not Numeric and block is given' do
        expect(f.my_all?(Numeric)).to eql(false)
      end

      it 'should return true if all the elements in the argument contain t and block is given' do
        expect(["ant", "beat", "cat"].my_all?(/t/) ).to eql(true)
      end

      it 'should return false if all the elements in the argument do not contain t and block is given' do
        expect(["ant", "bear", "cat"].my_all?(/t/) ).to eql(false)
      end

      it 'should return true if all the words in the argument has 3 letters and above and block is given' do
        expect(["ant", "bear", "cat"].my_all?{ |word| word.length >= 3 } ).to eql(true)
      end

      it 'should return false if all the words in the argument has 4 letters and above and block is given' do
        expect(["ant", "bear", "cat"].my_all?{ |word| word.length >= 4 } ).to eql(false)
      end
    end

    describe '#my_any?' do
      it 'should return false if no argument and block is given' do
        expect([].my_any?).to eql(false)
      end

      it 'should return true if argument is given and block is not given' do
        expect(e.my_any?).to eql(true)
      end

      it 'should return true if there is at least one Numeric in the elements in the argument and block is given' do
        expect(e.my_any?(Numeric)).to eql(true)
      end

      it 'should return false if none of the elements in the argument contain d and block is given' do
        expect(["ant", "bear", "cat"].my_any?(/d/) ).to eql(false)
      end

      it 'should return true if at least one of the words in the argument has 3 letters and above and block is given' do
        expect(["ant", "bear", "cat"].my_any?{ |word| word.length >= 3 } ).to eql(true)
      end

      it 'should return true if at least one of the words in the argument has 4 letters and above and block is given' do
        expect(["ant", "bear", "cat"].my_any?{ |word| word.length >= 4 } ).to eql(true)
      end
    end
end
