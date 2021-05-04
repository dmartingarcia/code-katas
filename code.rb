class FirstSolution
  def self.solution(x)
    is_negative = x < 0
    integer_array = Tools.split_integer(x)
    result = -9999

    (integer_array.size + 1).times.each do |index|
      value = integer_array.dup.insert(index, 5).join("").to_i

      value = -value if is_negative

      result = [value, result].max
    end

    result
  end
end

class Tools
  def self.split_integer(x)
    x.to_s.split("").map{|val| val == "-" ? nil : val.to_i }.compact
  end

  def self.check_solution(value, expected_value)
    puts "VALUE: #{value} EXPECTED: #{expected_value}"
    raise if FirstSolution.solution(value) != expected_value
  end
end


raise if Tools.check_solution(234, 5234)
raise if Tools.check_solution(-234, -2345)
raise if Tools.check_solution(671, 6751)
raise if Tools.check_solution(-671, -5671)
raise if Tools.check_solution(-1, -15)
raise if Tools.check_solution(1, 51)
puts "Allright!!!"
