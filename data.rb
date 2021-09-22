require_relative 'google_sheet.rb'
require_relative 'algo_timer.rb'
include Timer


@sheet = Sheet.new

@cols = [ ['Input','Time (seconds)']]

@n = 5000
@arr = []
@values = []

proc = Proc.new { @arr.shuffle }

while @n < 100000
  (1..@n).each { |input| 
    @arr << input
  }
  seconds = time(proc)
  @values << [@n, seconds]
  p @n 
  p seconds
  @n += 10000
end

@sheet.add_to_sheet(@values)








