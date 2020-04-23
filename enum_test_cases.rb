# arr=[1,2,3, 6, 3, 3, 3,4,5,3,3,"Ritta"]
# hash = {one: 1, two: 2, three: 3}
# puts arr.my_count{ |i| i % 2 == 0}
# puts arr.my_inject { |sum, i| sum * i }
# hash.my_each {|x| puts x}
# puts arr.my_each
# hash.my_each{ |i, j| puts "#{i} #{j}"}
# puts arr.my_count{ |x| x % 2 == 0}
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 }
# puts %w[ant bear cat].my_all?(/t/)
# puts [1, 2i, 3.14].my_all?(Numeric)
# puts [nil, true, 99].my_all?
# puts [].my_all?
# puts %w[ant bear cat].my_any? { |word| word.length >= 3 }
# puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
# puts %w[ant bear cat].any?(/d/)
# puts [nil, true, 99].any?(Integer)
# puts [nil, true, 99].any?
# puts [].any?
# puts %w{ant bear cat}.none? { |word| word.length == 5 }
# puts %w{ant bear cat}.none? { |word| word.length >= 4 }
# puts %w{ant bear cat}.none?(/d/)
# puts [1, 3.14, 42].none?(Float)
# puts [].none?
# puts [nil].none?
# puts [nil, false].none?
# puts [nil, false, true].none?
# print (1..4).my_map { |i|  i*i }
# print (1..4).my_map { "cat"  }
# puts (5..10).reduce(:+)
# puts (5..10).my_inject { |sum, n| sum + n }
# puts (5..10).reduce(1, :*)
# puts (5..10).my_inject(1) { |product, n| product * n }
# longest = %w{ cat sheep bear }.inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# puts longest
# multiply_els([2,4,5])
# a = [ "a", "b", "c" ]
# a.my_each {|x| print x, " -- " }
# a = [ "a", "b", "c" ]
# a.my_each_with_index {|x, i| print i, " -- " }
# puts [1,2,3,4,5].my_select { |num|  num.even?  }
# a = %w{ a b c d e f }
# print a.my_select { |v| v =~ /[aeiou]/ }
