# Please implement your solution to isogram in this file
class Isogram

  def self.isogram?(s : String)
    chars = s.downcase.chars.select(&.letter?)
    chars.size == chars.to_set.size
  end
end
