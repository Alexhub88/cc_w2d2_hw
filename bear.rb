class Bear

  attr_reader :name
  attr_accessor :stomach

  def initialize(name, stomach = [])
    @name = name
    @stomach = stomach
  end

  def eat_a_fish(fish)
    @stomach.push(fish)
    return @stomach
  end

  def is_starving
    if @stomach.length == 0
      return true
    else
      return false
    end
  end

  def hunt_for_fish(river)
    if river.fish_count > 0
      fish_stock = river.fishstock
      fish = fish_stock[0]
      eat_a_fish(fish)
      river.fishstock.shift
    else
      puts "There are no fish in the river for the bear to eat!"
      return []
    end
    return river.fishstock
  end

end
