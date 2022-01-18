class AllYourBase

  def self.rebase(orig_base : Int32, seq : Array(Int32), target_base : Int32)
    raise ArgumentError.new "Base must be 2 or higher." if orig_base < 2 || target_base < 2
    raise ArgumentError.new "Invalid number in sequence." if seq.map { |i| 0 <= i < orig_base }.includes?(false)
    return [0] if seq.empty? || (seq.uniq.includes?(0) && seq.uniq.size == 1)
    self.convert(seq.reverse.map_with_index { |n, i| orig_base ** i * n }.sum, target_base)
  end

  private def self.convert(num, target_base)
    converted_number = [] of Int32
    while num > 0
      num, digit = self.divmod(num, target_base)
      converted_number << digit
    end
    converted_number.reverse
  end

  private def self.divmod(num : Int32, target_base : Int32)
    digit = num % target_base
    num = num // target_base
    return num, digit
  end
end
