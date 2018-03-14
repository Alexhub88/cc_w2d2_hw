require ("minitest/autorun")
require_relative("../river")
require_relative("../fish")

class RiverTest < Minitest::Test

  def setup
    @fish1 = Fish.new("Trout")
    @fish2 = Fish.new("Salmon")
    @fishstock = [@fish1, @fish2]
    @river = River.new("Nile", @fishstock)
  end

  def test_river_has_name
    assert_equal("Nile", @river.name)
  end

  def test_fish_count
    assert_equal(2, @river.fish_count)
  end

end
