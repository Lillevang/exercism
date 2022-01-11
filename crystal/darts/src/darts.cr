class Darts
  def self.score(x : Float64, y : Float64)
    r = (x**2 + y**2)**0.5
    r <= 1 ? 10 : r <= 5 ? 5 : r <= 10 ? 1 : 0
  end
end
