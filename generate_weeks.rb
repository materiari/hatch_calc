require 'date'

start = Date.parse('2014/06/29')
ends = start+6
(0..11).each do |x|
  puts "#{x+1},#{start+(7*x)},#{ends+(7*x)}"
end
