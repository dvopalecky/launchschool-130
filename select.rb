def select(array)
  out_array = []
  counter = 0
  while counter < array.size
    if yield(array[counter])
      out_array << array[counter]
    end
    counter += 1
  end

  out_array
end

array = [1, 2, 3, 4, 5]

x = select(array) { |num| num.odd? }      # => [1, 3, 5]
p x
x = select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p x
x = select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
p x
