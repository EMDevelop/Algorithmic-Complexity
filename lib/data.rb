require_relative 'google_sheet.rb'
require_relative 'timer.rb'
include Timer
# irb -r './lib/data.rb'
# load './lib/data.rb'
# t = TestComplexity.new
# t.begin

class TestComplexity

  LOOPS = 3
  START_INPUT = 5000
  END_INPUT = 100000
  WAIT_SECONDS = 0
  

  def initialize
    @sheet = Sheet.new
    @n = 5000
    @arr = []
    @values = []
    @test_case = 1
    @input_loop = 0
  end

  attr_reader :arr, :values

  def setup_data
    (1..@n).each { |input|  @arr << input }
  end

  def tested_method
    Proc.new { @arr.shuffle }
  end 

  def reset_data
    @n = START_INPUT
    @input_loop = 0
    @arr = []
  end


  def begin
    LOOPS.times { 
      p "Begginning loop: #{@test_case}" 
      reset_data
      test_complexity
      @test_case += 1
      sleep(WAIT_SECONDS)
    }
    calculated_average
    add_to_sheet
  end

  def test_complexity
    while @n <= END_INPUT
      setup_data 
      seconds = time(tested_method)
      store_data(seconds)
      print_values(seconds)
      @n += 5000
      @input_loop += 1
    end
  end

  def calculated_average
    @values.each { |value| 
      value << [value[0] + value[1] + value[2]].sum / 3
    }
  end

  def store_data(seconds)
    if @test_case == 3
      @values[@input_loop] << seconds
      @values[@input_loop] <<  @n
    elsif @test_case == 1
      @values <<  [seconds]
    else
      @values[@input_loop]  << seconds 
    end
  end

  def print_values(seconds)
    puts "Input: #{@n} | Seconds: #{seconds}"
  end


  def add_to_sheet
    @sheet.add_to_sheet(@values)
  end

end











