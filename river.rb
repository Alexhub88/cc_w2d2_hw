class River

  attr_reader :name
  attr_accessor :fishstock

  def initialize(name, fishstock)
    @name = name
    @fishstock = fishstock
  end

  def fish_count()
    if @fishstock == nil
      return 0
    else
      return @fishstock.length
    end
  end

end
