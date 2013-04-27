# require "./preeventualist"
# puts PreEventualist.search( 'truck' )
require "active_support/all"
array = %w(green violet purple, deathstar schtrosstruppen)
p array
params = { type: :text }
defaults = { lang: :en }
params.reverse_merge!(defaults).except! (:type)
p params