# frozen_string_literal: true

Reading = Struct.new :direction, :value
Result = Struct.new :horizont, :depth, :aim

PART1_MAPPING = {
  'forward' => ->(h, inc) { h.horizont += inc },
  'down' => ->(h, inc) { h.depth += inc },
  'up' => ->(h, inc) { h.depth -= inc }
}.freeze

PART2_MAPPING = {
  'forward' => lambda { |h, inc|
                 h.horizont += inc
                 h.depth += h.aim * inc
               },
  'down' => ->(h, inc) { h.aim += inc },
  'up' => ->(h, inc) { h.aim -= inc }
}.freeze

def calculate_position(readings, mappings)
  result = Result.new 0, 0, 0

  readings.each do |reading|
    mappings[reading.direction].call(result, reading.value)
  end

  result['horizont'] * result['depth']
end

readings = []

File.foreach('day_2.txt') do |line|
  direction, inc = line.split(' ')

  readings << Reading.new(direction, inc.to_i)
end

puts "Result Part1: #{calculate_position(readings, PART1_MAPPING)}"
puts "Result Part2: #{calculate_position(readings, PART2_MAPPING)}"
