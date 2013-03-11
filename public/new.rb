#!/usr/bin/ruby

kitty_toys =
[:shape => 'sock', :fabric => 'cashmere'] +
[:shape => 'mouse', :fabric => 'calico'] +
[:shape => 'eggroll', :fabric => 'chenille']
kitty_toys.sort_by { |element| element[:shape] }. each { |element| puts "#{element[:fabric] }"}