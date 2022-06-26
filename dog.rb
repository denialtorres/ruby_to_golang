class Dog
  def initialize(breed)
    @breed = breed
  end

  def kind
    @breed
  end
end

dog = Dog.new("Rottweiler")

puts dog.kind
