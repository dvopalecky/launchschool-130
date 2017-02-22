class Person
  @@total_people = 0

  attr_accessor :name, :weight, :height

  def self.total_people
    @@total_people
  end

  def initialize(name, weight, height)
    @name = name
    @weight = weight
    @height = height
    @@total_people += 1
  end

  def change_info(name, weight, height)
    self.name = name
    self.weight = weight
    self.height = height
  end
end

bob = Person.new('bob', 185, 70)
Person.total_people # this should return 1

bob.change_info('rick', 199, 20)
