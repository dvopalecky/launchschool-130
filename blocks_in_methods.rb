# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# say("hi there") do
#   system 'clear'
# end

def increment(number)
  if block_given?
    yield
  else
    number + 1
  end
end

x = increment(5) do |num|
  puts num
end

p x

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

x = compare('hi') { |word| puts "hi" }
p x

def time_it
  time_before = Time.now
    yield if block_given?
  time_after = Time.now
  puts "It took #{time_after - time_before} seconds"
end

#time_it { sleep (3) }
time_it { "hello world" }

def test(&block)
  puts "What's &block?  #{block}"
end

test { "hello" }
