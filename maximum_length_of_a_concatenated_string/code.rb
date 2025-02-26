class Solver
  def self.max_length(arr)
    head, *tail = arr
    return max_length_r(head.length, head, tail)
  end

  def self.max_length_r(max_val, head, tail)
    return max_val if tail.size == 0

    tail.each do |elem|
      next if (head.chars & elem.chars).any?
      partial = [head, elem].join
      puts partial
      max_val = [max_val, partial.length].max
    end

    head, *tail = tail

    return max_length_r(max_val, head, tail)
  end
end

class Tools
  def self.check_solution(value, expected_value)
    result = Solver.max_length(value)
    raise "invalid #{result} != #{expected_value}" if result != expected_value
  end
end

raise if Tools.check_solution(['un','iq','ue'], 4)
raise if Tools.check_solution(['cha','r','act','ers'], 6)
raise if Tools.check_solution(['abcdefghijklmnopqrstuvwxyz'], 26)

puts "all tests passed"