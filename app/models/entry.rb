class Entry < ActiveRecord::Base
  attr_accessible :name, :winner
  validates_presence_of :name
end
