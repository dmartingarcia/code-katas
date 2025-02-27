input = [
  "Q: Database ready",
  "Q: Elements loaded",
  "Q: Stacktrace",
  "Q: Failure",
  "L: database is ready",
  "L: all elements loaded from database are ready",
  "Q: Failure while loading",
  "L: stacktrace failure found while loading the configuration for the database",
]

test_output = [
"QUERY: Database ready; id=1",
"QUERY: Elements loaded; id=2",
"QUERY: Stacktrace; id=3",
"QUERY: Failure; id=4",
"MATCH: database is ready; IDs=1",
"MATCH: all elements loaded from database are ready; IDs=1,2",
"QUERY: Failure while loading; id=5",
"MATCH: stacktrace failure found while loading the configuration for the database; IDs=3,4,5",
]

require 'set'
queries = []
output = []

input.each do |line|
  line_content = line[3..-1]
  line_set = line_content.downcase().split().to_set
  if line.start_with?("Q:")
    queries << line_set
    output << "QUERY: #{line_content}; id=#{queries.length}"
  elsif line.start_with?("L:")
    matched_ids = []
    queries.each_with_index do |query, index|
      if query.sort == line_set.intersection(query).sort
        matched_ids << index + 1
      end
    end
    output << "MATCH: #{line_content}; IDs=#{matched_ids.join(',')}"
  end
end

if test_output == output
  puts "Test passed"
else
  puts "Test failed"
  puts "Expected:"
  puts test_output
  puts "Got: "
  test_output.each_with_index do |line, index|
    if output[index] != line
      puts "- #{line}"
      puts "+ #{output[index]}"
    else
      puts line
    end
  end
end
