#!/usr/bin/ruby
code_words = {
'starmonkeys' => 'Phil and Pete, those prickly chancellors of the New Reich',
'catapult' => 'chucky go-go', 'firebomb' => 'Heat-Assisted Living',
'Nigeria' => "Ny and Jerry's Dry Cleaning (with Donuts)",
'Put the kabosh on' => 'Put the cable box on'
}
require "./words.rb"
print "Enter you plans!"
plans = gets
code_words.each do |real, code|
  plans.gsub!(real, code)
end
print 'Filename:'
name = gets.strip
File::open('idea-'+name+'.txt',"w") do |f|
  f<< plans
end
