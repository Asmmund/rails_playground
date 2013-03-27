#!/usr/bin/ruby
def add(*numbers)
  numbers.inject { |sum, item| sum + item }
end

 # p add(12,4323,1,-4323)
def substract(*numbers)
  result = numbers.shift
  numbers.inject(result) { |result, item|  result - item }
end

# p substract(100,1,2,3,4)

def calculate(*arguments)
 options = arguments[-1].is_a?(Hash) ? arguments.pop : {}
 options[:add] = true if options.empty?
 return add(*arguments) if options[:add]
 return substract(*arguments) if options[:substract]
end
# p calculate(100,100)
# p calculate(100,100,{substract: true} )

def pig_latin(word)
  return word << 'ay' if word =~ /^[aeiouy]/
  __,consonant,remaining = word.partition(/qu|[aeiou]+/)
  return remaining << consonant << 'ay'
end

# puts pig_latin 'ill'
def find_unique( values )
  values.find_all { |x| values.count(x) == 1 }
end
# p find_unique [1,2,1,1,3,6,2,6,8]

  def karprekar_number( k )
    no_digits = k.to_s.size
    square = (k*k).to_s
    second_half = square[-no_digits..-1]
    first_half = square.size.even? ?
      square[0..no_digits-1] :
      square[0..no_digits-2]
    k == first_half.to_i + second_half.to_i
  end

  # p karprekar_number(297)
class MyArray
  attr_reader :array

  def initialize( array )
    @array = array
  end
  def sum( initial_value = 0 )
    return @array.inject(:+) + initial_value unless block_given?
    sum = initial_value
    @array.each { |n| sum += yield(n) }
    sum
  end

end
a = MyArray.new([2,3,1])
p a.sum(10) { |k| k**3 }
