# Please implement your solution to anagram in this file
module Anagram
    extend self

    def find(s : String, words : Array(String)) : Array(String)
        words.select { |w| w.downcase.split("").sort == s.downcase.split("").sort && w.downcase != s.downcase}
    end
    
end