class Pangram

  def self.pangram?(s : String)
    return s.downcase.chars.to_set.count(&.ascii_letter?) < 26 ? false : true
  end

end
