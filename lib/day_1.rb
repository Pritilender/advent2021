# frozen_string_literal: true

def increment_count(arr)
  increments = 0
  previous = nil

  arr.each do |el|
    increments += 1 if previous && previous < el

    previous = el
  end

  increments
end

# Part 1
readings = []
File.foreach('day_1.txt') { readings << _1.to_i }
part_1_increments = increment_count readings

puts "Part 1 solution is #{part_1_increments}"

# Part 2
windowed_readings = readings.each_cons(3).map(&:sum)
part_2_increments = increment_count windowed_readings

puts "Part 2 solution is #{part_2_increments}"
