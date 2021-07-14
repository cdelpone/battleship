class Ship
  attr_reader :name, :length, :hit_count

  def initialize(name, length)
    @name = name
    @length = length
    @hit_count = 0
  end

  def health
    health = @length - @hit_count
  end

  def hit
    @hit_count += 1
  end

  def sunk?
    if @hit_count == @length
      true
    else @hit_count < @length
      false
    end
  end
end
