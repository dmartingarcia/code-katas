class Solver
  def self.solution(array)
    counter = {}
    acc = 1

    array.sort.each do |item|
      if acc == item
        acc += 1
      end
    end

    acc
  end
end

class Tools
  def self.check_solution(value, expected_value)
    raise if Solver.solution(value) != expected_value
  end
end

raise if Tools.check_solution([1, 3, 6, 4, 1, 2], 5)
raise if Tools.check_solution([1, 2, 3], 4)
raise if Tools.check_solution([-1, -3], 1)

puts "Allright!!!"
