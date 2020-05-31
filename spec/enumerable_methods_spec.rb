require './enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:b) { [1, 3, 5, 7] }
  let(:c) { [1, 2, 4, 2] }
  let(:d) { %w[ant bear cat] }
  let(:e) { [nil, true, 99] }
  let(:f) { [1, 2, 3, 4, 'cool'] }

  describe '#my_each' do
    it 'should return enumerator if no block is given' do
      expect(b.my_each).to be_a(Enumerator)
    end

    it 'should return an array if an array is given' do
      expect(b.my_each { |i| i }).to eql(b)
    end
  end

  describe '#my_each_with_index' do
    it 'should return enumerator if no block is given' do
      expect(d.my_each).to be_a(Enumerator)
    end

    it 'Should return i and j if block is given' do
      hash = {}
      expect(d.my_each_with_index { |i, j| hash[i] = j }).to eql(d)
    end
  end

  describe '#my_select' do
    it 'should return enumerator if no block is given' do
      expect(b.my_select).to be_a(Enumerator)
    end

    it 'Should return even numbers if a block is given' do
      expect(c.my_select(&:even?)).to eql([2, 4, 2])
    end

    it 'Should return odd numbers if a block is given' do
      expect(b.my_select(&:odd?)).to eql([1, 3, 5, 7])
    end

    it 'Should return words with the required length' do
      expect(d.my_select { |word| word.length == 3 }).to eq(%w[ant cat])
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
      expect(%w[ant beat cat].my_all?(/t/)).to eql(true)
    end

    it 'should return false if all the elements in the argument do not contain t and block is given' do
      expect(%w[ant bear cat].my_all?(/t/)).to eql(false)
    end

    it 'should return true if all the words in the argument has 3 letters and above and block is given' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
    end

    it 'should return false if all the words in the argument has 4 letters and above and block is given' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).to eql(false)
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
      expect(%w[ant bear cat].my_any?(/d/)).to eql(false)
    end

    it 'should return true if at least one of the words in the argument has 3 letters and above and block is given' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
    end

    it 'should return true if at least one of the words in the argument has 4 letters and above and block is given' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
    end
  end

  describe '#my_none?' do
    it 'should return true if no argument and block is given' do
      expect([].my_none?).to eql(true)
    end

    it 'should return true if it has nil as the argument and no block is given' do
      expect([nil].my_none?).to eql(true)
    end

    it 'should return true if it has nil and false as the argument and no block is given' do
      expect([nil, false].my_none?).to eql(true)
    end

    it 'should return false if any of the argument returns true and no block is given' do
      expect([nil, true, false].my_none?).to eql(false)
    end

    it 'should return false if any of the argument has a float value and a block is given' do
      expect([1, 3.14, 42].my_none?(Float)).to eql(false)
    end

    it 'should return true if none of the argument contains d and a block is given' do
      expect(d.my_none?(/d/)).to eql(true)
    end

    it 'should return true if none of the argument contains 5 letters and a above and a block is given' do
      expect(d.my_none? { |word| word.length == 5 }).to eql(true)
    end

    it 'should return false if any of the argument contains 4 letters and a above and a block is given' do
      expect(d.my_none? { |word| word.length >= 4 }).to eql(false)
    end
  end

  describe '#my_count' do
    it 'should return the length of the argument provided if no block is given' do
      expect(c.my_count).to eql(4)
    end

    it 'should count the number of times that 2 appears in the array' do
      expect(c.my_count(2)).to eql(2)
    end

    it 'should count how many even numbers appear in the array' do
      expect(c.my_count(&:even?)).to eql(3)
    end
  end

  describe '#my_map' do
    it 'should return enumerator if no block is given' do
      expect(b.my_map).to be_a(Enumerator)
    end

    it 'should return a new array with i * i for the numbers between 1 and 4' do
      expect((1..4).my_map { |i| i * i }).to eq([1, 4, 9, 16])
    end
  end

  describe '#my_inject' do
    it 'should find the sum of numbers between 5 and 10' do
      expect((5..10).my_inject { |sum, n| sum + n }).to eql(45)
    end

    it 'should find the product of numbers between 5 and 10' do
      expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151_200)
    end

    it 'should find the longest word in the given array' do
      expect(%w[cat sheep bear].my_inject { |memo, word| memo.length > word.length ? memo : word }).to eql('sheep')
    end
  end

  describe '#multiply_els' do
    it 'should test whether my_inject is working correctly' do
      expect([3, 10].my_inject { |sum, i| sum * i }).to eq(30)
    end
  end
end
