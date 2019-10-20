require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'

class PassengerTest < Minitest::Test
  def setup
  @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
  @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists
    assert_instance_of Passenger, @charlie
  end

  def test_instance_variables
    name = "Charlie"
    age = 18
    assert_equal name, @charlie.name
    assert_equal age, @charlie.age
  end

  def test_adult_age
    assert_equal false, @taylor.adult?
    assert_equal true, @charlie.adult?
  end

  def test_drive_and_driver
    assert_equal false, @charlie.driver?
    @charlie.drive
    assert_equal true, @charlie.driver?
  end

end
