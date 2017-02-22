def each(arr)
  i = 0
  while i < arr.size do
    yield(arr[i]) if block_given?
    i += 1
  end

  arr
end

x = [1, 2, 3].each { |num| "do nothing" }
puts "Return value:"
p x

x = each([1, 2, 3]) { |num| "do nothing" }
puts "Return value:"
p x

x = each([1, 2, 3, 4, 5]) do |num|
  puts num
end
puts "Return value:"
p x
