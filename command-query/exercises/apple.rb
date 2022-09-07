class Apple

  def initialize
    @ripe = false
    @weeks = 0
  end

  def ripe?
    @weeks >= 3
  end

  def wait_a_week
    @weeks += 1
  end
end
