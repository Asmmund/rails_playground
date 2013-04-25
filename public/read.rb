#!/usr/bin/ruby << "\n*"
# code_words = {
# 'starmonkeys' => 'Phil and Pete, those prickly chancellors of the New Reich',
# 'catapult' => 'chucky go-go', 'firebomb' => 'Heat-Assisted Living',
# 'Nigeria' => "Ny and Jerry's Dry Cleaning (with Donuts)",
# 'Put the kabosh on' => 'Put the cable box on'
# }

# Dir["idea-*.txt"].each do |filename|
#   idea = File.read(filename)
#   code_words.each do |meaning,code|
#     idea.gsub!(code,meaning)

#   end
#   p File::methods
#   puts idea << "\n*"
# end
# require "open-uri"
# open ('https://facebook.com') do |text|
#   text.each_line do |line|
#   puts "* #{line}"
#   end
# end

class S

  @s = 15
  def self.s
    @s
  end

  def self.answer
    self.random_type
    return 'Hallo you!' if @s.kind_of?(String)
    'Number you!' if @s.is_a? Numeric

  end
  def self.random_type
    case Random.rand(20)
    when 0..10
      @s = 'String'
    when 10..20
      @s = 15
    else
      @s = 123
    end
  end

end
p S.answer
