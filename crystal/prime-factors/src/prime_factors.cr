class PrimeFactors

  def self.factors(n)
    seq = [] of Int32
    div = 2
    while n > 1
      if n.divisible_by?(div)
        n = n // div
        seq << div
      else
        div += 1
      end
    end
    seq
  end
end
