class Car
  attr_accessor :speed, :manufacturer

  def initialize(manufacturer)
    @manufacturer = manufacturer
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def accelerate(increment)
    @speed += increment
  end
end

audi = Car.new('Audi')
porshe = Car.new('Porshe')
puts audi.speed
audi.accelerate(40)
puts audi.speed

class Animal
  attr_accessor :gender

  def initialize(gender)
    @gender = gender
  end
end

module Swimmable
end

class Fish < Animal
  include Swimmable
  def swim
    puts 'I can swim'
  end
end

nemo = Fish.new(:male)
nemo.swim
puts nemo.gender
