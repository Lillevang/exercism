class Grains

  def self.square(n)
    raise ArgumentError.new "n cannot be negative or above 64" if n < 1 || n > 64
    1u64 << (n - 1)
  end

  def self.total
    UInt64::MAX
  end

end
