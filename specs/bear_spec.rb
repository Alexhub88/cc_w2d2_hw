require ("minitest/autorun")
require_relative("../bear")
require_relative("../river")
require_relative("../fish")

class BearTest < Minitest::Test

  def setup

    @fish1 = Fish.new("Trout")
    @fish2 = Fish.new("Salmon")
    @fishstock = [@fish1, @fish2]
    @empty_river_fishstock = []

    @river = River.new("Nile", @fishstock)
    @empty_river = River.new("Rhine", @empty_river_fishstock)

    @fish3 = Fish.new("Carp")
    @fish4 = Fish.new("Perch")
    @fish5 = Fish.new("Hammerhead Shark")
    @stomach = [@fish3, @fish4, @fish5]
    @bear1 = Bear.new("Knut", @stomach)
    @stomach_bear2 = []
    @bear2 = Bear.new("Teddy", @stomach_bear2)
    @stomach_bear3 = [@fish5]
    @bear3 = Bear.new("Kodiak", @stomach_bear3)

  end

  def test_bear_has_name
    assert_equal("Knut", @bear1.name)
  end

  def test_fish_in_bear_stomach
    assert_equal(3, @bear1.stomach.length)
  end

  def test_bear_eat_a_fish
    fish_stock = @river.fishstock
    fish = fish_stock[0]
    @bear1.eat_a_fish(fish)
    assert_equal(4, @bear1.stomach.length)
  end

  def test_bear_is_starving
    assert_equal(false, @bear1.is_starving)
    assert_equal(true, @bear2.is_starving)
  end

  def test_bear_hunt_for_fish

    assert_equal(3, @bear1.stomach.length)
    assert_equal(2, @river.fishstock.length)
    @bear1.hunt_for_fish(@river)
    assert_equal(4, @bear1.stomach.length)
    assert_equal(1, @river.fishstock.length)

    assert_equal(1, @bear3.stomach.length)
    assert_equal(0, @empty_river.fish_count)
    @bear3.hunt_for_fish(@empty_river)
    assert_equal(1, @bear3.stomach.length)
    assert_equal(0, @empty_river.fish_count)
  end

end
