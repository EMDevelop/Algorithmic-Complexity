require_relative 'google_sheet.rb'
require_relative 'timer.rb'
include Timer
# irb -r './lib/data.rb'
# load './lib/data.rb'
# t = TestComplexity.new
# t.begin

class TestComplexity

  LOOPS = 3
  MAXIMUM_TESTED_INPUT = 10000

  def initialize
    @sheet = Sheet.new
    @n = 5000
    @arr = []
    @values = []
    @test_case = 1
    @input_loop = 0
  end

  attr_reader :arr, :values

  def begin
    LOOPS.times { 
      p "ye"
      @n = 5000
      @input_loop = 0
      test_complexity
      @test_case += 1
      sleep(60)
    }
    add_to_sheet
  end

  def test_complexity
    while @n <= MAXIMUM_TESTED_INPUT
      setup_data 
      seconds = time(tested_method)
      store_data(seconds)
      print_values(seconds)
      @n += 5000
      @input_loop += 1
    end
  end

  def store_data(seconds)
    p @test_case
    @test_case == 1 ? @values << [@n, seconds] : @values[@input_loop] << seconds
  end

  def setup_data
    (1..@n).each { |input|  @arr << input }
  end

  def print_values(seconds)
    puts "Input: #{@n} | Seconds: #{seconds}"
  end

  def tested_method
    Proc.new { @arr.shuffle }
  end 

  def add_to_sheet
    @sheet.add_to_sheet(@values)
  end

end











