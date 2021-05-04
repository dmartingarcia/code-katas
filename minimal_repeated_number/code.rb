class Solver
  def self.solution(array)
    counter = {}

    array.each do |item|
      if counter[item]
        counter[item] += 1
      else
        counter[item] = 1
      end
    end

    counter.reject do |k,v|
      v == 1
    end.keys.sort.min
  end
end

class Tools
  def self.check_solution(value, expected_value)
    raise if Solver.solution(value) != expected_value
  end
end

raise if Tools.check_solution([1],  nil)
raise if Tools.check_solution([1, 2, 4, 5, 5, 6, 2], 2)
raise if Tools.check_solution([1, 2, 4, 5, 5, 6, 2, 1], 1)

puts "Allright!!!"
