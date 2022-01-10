# Please implement your solution to hamming in this file
module Hamming
  extend self

  def distance(s1 : String, s2 : String)
    raise ArgumentError.new "The two Strings must have equal size" unless s1.size == s2.size
    s1.chars.zip(s2.chars).count { |pair| pair[0] != pair[1] }
  end


end
