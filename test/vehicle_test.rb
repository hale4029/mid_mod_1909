require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require './lib/vehicle'

class VehicleTest < Minitest::Test

  def setup
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists
    assert_instance_of Vehicle, @vehicle
  end

  def test_instance_variables
    assert_equal "2001", @vehicle.year
    assert_equal "Honda", @vehicle.make
    assert_equal "Civic", @vehicle.model
    assert_equal [], @vehicle.passengers
    assert_equal false, @vehicle.speeding
  end

  def test_if_speeding
    assert_equal false, @vehicle.speeding?
    @vehicle.speed
    assert_equal true, @vehicle.speeding?
  end

  def test_adding_passengers
    @vehicle.add_passenger(@charlie)
    assert_equal 1, @vehicle.passengers.count
    assert_equal true, @vehicle.passengers.include?(@charlie)
    assert_equal false, @vehicle.passengers.include?(@jude)
    assert_equal false, @vehicle.passengers.include?(@taylor)
    @vehicle.add_passenger(@jude)
    assert_equal 2, @vehicle.passengers.count
    assert_equal true, @vehicle.passengers.include?(@charlie)
    assert_equal true, @vehicle.passengers.include?(@jude)
    assert_equal false, @vehicle.passengers.include?(@taylor)
    @vehicle.add_passenger(@taylor)
    assert_equal 3, @vehicle.passengers.count
    assert_equal true, @vehicle.passengers.include?(@charlie)
    assert_equal true, @vehicle.passengers.include?(@jude)
    assert_equal true, @vehicle.passengers.include?(@taylor)
  end

  def test_number_of_adults
    @vehicle.add_passenger(@charlie)
    assert_equal 1, @vehicle.num_adults
    @vehicle.add_passenger(@taylor)
    assert_equal 1, @vehicle.num_adults
    @vehicle.add_passenger(@jude)
    assert_equal 2, @vehicle.num_adults
  end

end
