class Solver
  def max_length(arr)
    head, *tail = arr
    
    return max_length_r(head.length, head, tail)
  end

  def max_length_r(max_val, head, tail)
    return max_val if tail.size == 0
    
    tail.each do |elem|
      max_val = [max_val, [head, elem].join.length].max 
    end
    
    head, *tail = tail
    
    return max_length_r(max_val, head, tail) 
  end
end

class Tools
  def self.check_solution(value, expected_value)
    raise if Solver.solution(value) != expected_value
  end
end

raise if Tools.check_solution(['un','iq''ue'], 4)
raise if Tools.check_solution(['cha','r','act','ers'], 6)
raise if Tools.check_solution(['abcdefghijklmnopqrstuvwxyz'], 26)

