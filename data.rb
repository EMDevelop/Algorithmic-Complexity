require_relative 'google_sheet.rb'

@sheet = Sheet.new

@sheet.add_to_sheet([[1,2],[3,4]])

@n = 5000
@arr = []
p @sheet



# while @n < 1000000
#   (1..@n).each { |input| 
#     @arr << input
#   }
#   start_time = Time.new
#   @arr.shuffle
#   end_time = Time.new
#   @n += 10000
#   p @n 
#   p end_time - start_time
# end








