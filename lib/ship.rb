class Ship
  attr_reader :name, :length, :hit_count

  def initialize(name, length)
    @name = name
    @length = length
    @hit_count = 0
  end

  def health
    health = @length
  end

  def hit

  end
end
