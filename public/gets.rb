#!/usr/bin/ruby
# puts "enter class name"
# class_name = gets
# eval("o = " + class_name + ".new")
# p o
class S
  def %( str )
    puts "You've been ....#{str}"
  end

end

s=S.new
s % 'SS'

p [1,2,3,4,3,6] - [3,2,9]