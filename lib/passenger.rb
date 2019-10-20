class Passenger
  attr_reader :name, :age

  def initialize(characteristics={})
   @name = characteristics['name']
   @age = characteristics['age']
   @drive = false
  end

  def adult?
    @age >= 18
  end

  def driver?
    @drive
  end

  def drive
    @drive = true
  end

end
