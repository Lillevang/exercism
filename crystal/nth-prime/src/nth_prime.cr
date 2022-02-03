class NthPrime

  # Already solved euler 7 in crystal. Reusing my solution:
  def self.prime(n)
    raise ArgumentError.new if n == 0
    primes = [2] of Int32
    count = 2
    until primes.size == n
      primes << count unless primes.find { |p| count%p == 0 }
      count += 1
    end
    primes.last
  end

end
