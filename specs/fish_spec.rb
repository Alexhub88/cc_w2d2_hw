require ("minitest/autorun")
require_relative("../fish")

class FishTest < Minitest::Test

  def setup
    @fish = Fish.new("Trout")
  end

  def test_fish_has_species
    assert_equal("Trout", @fish.species)
  end

end
