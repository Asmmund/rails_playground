module SModule
  def class_name
    'SuperClass'
  end
end
class Type
  include SModule

  attr_accessor :tickets

  def initialize(*object_list)
    @@winner ||= ''
    if object_list.empty? || !object_list.kind_of?( Array)
      raise ArgumentError, 'List of objects must be passed (array)'
    end
    @tickets ||= []
    object_list.each  do |object|
      @tickets << object
    end

    def check_ticket(*find)
      error = find.detect { |note| not @tickets.include? note }
      if error
        raise ArgumentError, "#{error} is not allowed"
      end

    end

  end

  def self.class
    'You don\'t want to know that'
  end
  def pick_winner
    @@winner = @tickets[rand(@tickets.length - 1)]
    @@winner
  end
end
t = Type.new '1234,234' ,'1324','!!'
p t.tickets
p t.pick_winner
p Type.class
t.check_ticket '!!', 1324.to_s
puts t.class_name