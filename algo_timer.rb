require 'Time'
module Timer
  
  def time(proc)
    start_time = Time.new
    proc.call
    end_time = Time.new
    end_time - start_time 
  end

end



