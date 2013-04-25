#!/usr/bin/ruby
# puts "enter class name"
# class_name = gets
# eval("o = " + class_name + ".new")
# p o
# class S
#   def %( str )
#     puts "You've been ....#{str}"
#   end

# end

class S
  attr_reader :s
  @k = 20
  def initialize( s = nil )
    @s = s || 15

  end
  def self.k
    @k
  end
end

class Gets
  def self.read(s, var  = :ins)
    raise ArgumentError, "must implemented #s" unless s.respond_to?( :s, :k )
    return s.s if var == :ins
    s.class.k if var == :med
  end

end

n = S.new 2400
p Gets.read( n, :med )


# p [1,2,3,4,3,6] - [3,2,9]