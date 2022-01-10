module MatchingBrackets

  PAIRS = {'(' => ')', '[' => ']', '{' => '}'}

  def self.valid?(s : String)
    stack = [] of Char
    s.chars.select{ |c| PAIRS.has_key?(c) || PAIRS.has_value?(c) }.each do |b|
      unless PAIRS.has_key? b
        return false if stack.empty? || PAIRS[stack.pop?] != b
      else
        stack << b
      end
    end
    stack.empty?
  end
end
