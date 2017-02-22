5.times do |num|
  puts num
end

p "---"

class Integer
  def times_danny
    i = 0
    while i < self
      yield(i)
      i += 1
    end

    self
  end
end

x = 5.times_danny do #|num|
  puts "ahoj" #num
end

puts "=> #{x}"
