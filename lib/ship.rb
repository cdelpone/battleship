class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name = name
    @length = length
    @hit_count = 0
  end

  def health
    @length - @hit_count
  end

  def sunk?
    @hit_count >= 3
  end

  def hit
    @hit_count += 1
  end

end
