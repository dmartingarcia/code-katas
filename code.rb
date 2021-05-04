def solution(x)
  is_negative = x < 0
  integer_array = split_integer(x)
  result = -9999

  (integer_array.size + 1).times.each do |index|
    value = integer_array.dup.insert(index, 5).join("").to_i

    value = -value if is_negative

    result = [value, result].max
  end

  result
end

def split_integer(x)
  x.to_s.split("").map{|val| val == "-" ? nil : val.to_i }.compact
end

raise if solution(234) != 5234
raise if solution(-234) != -2345
raise if solution(671) != 6751
raise if solution(-671) != -5671
raise if solution(-1) != -15
raise if solution(1) != 51
puts "Allright!!!"
