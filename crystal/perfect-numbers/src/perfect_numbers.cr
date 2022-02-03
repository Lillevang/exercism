class PerfectNumbers

  def self.classify(n)
    raise ArgumentError.new "n cannot be negative" unless n > 0
    x = (1...n).each.select { |i| n.divisible_by?(i) }.sum
    x == n ? "perfect" : x > n ? "abundant" : "deficient"
  end

end
