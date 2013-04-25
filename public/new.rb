#!/usr/bin/ruby

# kitty_toys =
# [:shape => 'sock', :fabric => 'cashmere'] +
# [:shape => 'mouse', :fabric => 'calico'] +
# [:shape => 'eggroll', :fabric => 'chenille']
# kitty_toys.sort_by { |element| element[:shape] }. each { |element| puts "#{element[:fabric] }"}

class New
  attr_accessor :f
  @k = 100
  def initialize(f)
    self.f=f
  end
  def self.k
    @k
  end
  def self.increace(n = nil)
    if n
      raise ArgumentError, "class must implement #increace" unless n.class.respond_to?(:increace)
      n.class.increace
    else
      @k +=  1
    end

  end
end

class Newer < New
  attr_accessor :l
  @k = 40
  def initialize(f,l)
    super(f)
    @l = l
  end


end
n1 = Newer.new('ffff','llll')
n2 = New.new('ffff')
p n2.class.increace n1
p n2.class.k
p n1.class.increace
p n1.class.k


