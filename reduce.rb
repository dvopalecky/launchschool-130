
row = [1]

x = row.reduce(-5) do |acc, num|
  puts "acc: #{acc}"
  puts "num: #{num}"
  puts '-' * 10
  acc + num
end

p x

def reduce(array, start_accumulator = nil)
  counter = nil

  if start_accumulator.nil?
    return nil if array.empty?
    accumulator = array[0]
    counter = 1
  else
    accumulator = start_accumulator
    counter = 0
  end

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

array = [1, 2, 3, 4, 5]

x = reduce(array) { |acc, num| acc + num }                    # => 15
p x
x = reduce(array, 10) { |acc, num| acc + num }                # => 25
p x
# x = reduce(array) { |acc, num| acc + num if num.odd? }
# => NoMethodError: undefined method `+' for nil:NilClass

arr = []
x = reduce(arr, 0) { |acc, num| acc + num }
p x
x = reduce(arr) { |acc, num| acc + num }
p x

arr_str = %w(a h o j)
p arr_str.reduce('--') { |a, e| a << e }
p reduce(arr_str, '--') { |acc, char| acc << char }
