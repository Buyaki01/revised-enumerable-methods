# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Style/CaseEquality

module Enumerable
  def my_each
    return to_enum :my_each unless block_given?

    case self
    when Array
      length.times do |i|
        yield(self[i])
      end
    when Hash
      length.times do |i|
        yield(keys[i], self[keys[i]])
      end
    else
      self
    end
  end

  def my_each_with_index
    return to_enum :my_each_with_index unless block_given?

    length.times do |i|
      yield self[i], i
    end
    self
  end

  def my_select
    return to_enum :my_select unless block_given?

    my_arr = []
    my_each { |x| my_arr << x if yield(x) }
    my_arr
  end

  def my_all?(*args)
    result = true
    if block_given?
      my_each do |i|
        result = false unless yield(i)
      end
    elsif !args[0].nil?
      my_each do |i|
        result = false unless args[0] === i
      end
    elsif empty? && args[0].nil?
      result = true
    else
      my_each do |i|
        result = false unless i
      end
    end
    result
  end

  def my_any?(*args)
    result = false
    if block_given?
      my_each do |i|
        result = true if yield(i)
      end
    elsif !args[0].nil?
      my_each do |i|
        result = true if args[0] === i
      end
    elsif empty? && args[0].nil?
      result = false
    else
      my_each do |i|
        result = true if i
      end
    end
    result
  end

  def my_none?(args = nil)
    result = if block_given?
               !my_any? { |i| yield i }
             else
               !my_any?(args)
             end
    result
  end

  def my_count(args = nil)
    return length if !block_given? && args.nil?

    count = 0
    if block_given? && args.nil?
      my_each { |x| count += 1 if yield(x) }
    end
    if args.is_a? Integer or args.is_a? String or args.is_a? Float
      my_each { |x| count += 1 if x == args }
    end
    if args.is_a? Regexp
      my_each { |x| count += 1 if x == args }
    end
    count
  end

  def my_map(args_proc = nil)
    return to_enum :my_map unless block_given? || args_proc.class == Proc

    new_arr = []
    new_object = to_a

    if !args_proc.nil?
      new_object.my_each do |i|
        new_arr.push(proc.call(i))
      end
    else
      new_object.my_each do |i|
        new_arr.push(yield(i))
      end
    end
    new_arr
  end

  def my_inject(args1 = nil, args2 = nil)
    new_object = to_a
    sum = new_object[0]
    t = 1

    if !args1.nil? && args2.class == Symbol
      sum = args1
      new_object.my_each { |i| sum = sum.send(args2, i) }

    elsif args1.nil? && args2.nil?
      loop do
        sum = yield(sum, new_object[t]) if block_given?
        t += 1
        break if t == new_object.length
      end
    elsif args1.class == Symbol
      loop do
        sum = sum.send(args1, new_object[t])
        t += 1
        break if t == new_object.length
      end

    elsif !args1.nil? && args2.nil?
      sum = args1
      new_object.my_each { |i| sum = yield(sum, i) } if block_given?
    end
    sum
  end

  def multiply_els(arr)
    arr.my_inject { |sum, i| puts sum * i }
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength:
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Style/CaseEquality
