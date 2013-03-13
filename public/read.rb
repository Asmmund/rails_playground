#!/usr/bin/ruby << "\n*"
code_words = {
'starmonkeys' => 'Phil and Pete, those prickly chancellors of the New Reich',
'catapult' => 'chucky go-go', 'firebomb' => 'Heat-Assisted Living',
'Nigeria' => "Ny and Jerry's Dry Cleaning (with Donuts)",
'Put the kabosh on' => 'Put the cable box on'
}

Dir["idea-*.txt"].each do |filename|
  idea = File.read(filename)
  code_words.each do |meaning,code|
    idea.gsub!(code,meaning)

  end
  p File::methods
  puts idea << "\n*"
end
require "open-uri"
open ('https://facebook.com') do |text|
  text.each_line do |line|
  puts "* #{line}"
  end
end
