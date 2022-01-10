class Primes
  def self.sieve(n)
    sieve = Array.new(n + 1, true)
    primes = Array(Int32).new
    2.upto(n) do |p|
      if sieve[p]
        primes << p
        p.upto(n // p) do |k|
          sieve[k * p] = false
        end
      end
    end
    primes
  end
end

