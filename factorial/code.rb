class Solver
  def self.solution(x)
    return 1 if x <= 1

    x * solution(x - 1)
  end
end

class Tools
  def self.check_solution(value, expected_value)
    raise if Solver.solution(value) != expected_value
  end
end

raise if Tools.check_solution(0, 1)
raise if Tools.check_solution(1, 1)
raise if Tools.check_solution(2, 2)
raise if Tools.check_solution(3, 6)
raise if Tools.check_solution(4, 24)
raise if Tools.check_solution(5, 120)
raise if Tools.check_solution(6, 720)
raise if Tools.check_solution(7, 5040)
raise if Tools.check_solution(8, 40320)
raise if Tools.check_solution(12, 479001600)

puts "Allright!!!"
