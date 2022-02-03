class Series

  def self.slices(s, n)
    raise ArgumentError.new "Size of substring is larger than string" if n > s.size || n <= 0
    Array.new(s.size - n + 1) { |i| s[i, n] }
  end
end
