require './enumerable_methods.rb'

RSpec.describe Enumerable do
    let(:b) { [1, 3, 5, 7] }
    let(:c) { [1, 2, 4, 2] }
    let(:d) { %w[(ant bear cat)] }
    let(:e) { [] } 

    describe '#my_each' do
      it 'if no block is given, it should return enumerator' do
        expect(b.my_each).to be_a(Enumerator)
      end

      it 'if an array is given, it should return an array' do
        expect(b.my_each {|i| i}).to eql(b)
      end
    end
end
