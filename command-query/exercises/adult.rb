class Adult

  def initialize
    @sobriety = true
    @drink_count = 0
  end

  def sober?
    @sobriety
    if @drink_count > 2
      @sobriety = false
    else
      true
    end
  end

  def consume_an_alcoholic_beverage
    @drink_count += 1
  end

end
