class Luhn
  def self.valid?(input_num : String) : Bool
    num = input_num.gsub(" ", "")
    return false unless num.matches?(/^\d{2,}/)  
    return false unless num.to_i64?
    return luhn_checksum(num.chars.map(&.to_i)).divisible_by?(10)
  end

  private def self.luhn_checksum(nums : Array(Int32)) : Int32
    nums.map_with_index { |n, i| 
      i.even? == nums.size.even? ? double_number(n) : n 
    }.sum
  end

  private def self.double_number(n : Int32)
    n * 2 > 9 ? n * 2 - 9 : n * 2
  end
end
