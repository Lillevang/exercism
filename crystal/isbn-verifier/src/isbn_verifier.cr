class IsbnVerifier
  
  def self.valid?(isbn : String) : Bool
    valid_format?(isbn) ? validate(convert_to_numeric(isbn)) : false
  end

  private def self.valid_format?(isbn : String)
    isbn.matches?(/\b\d-?\d{3}-?\d{5}-?[X0-9]\b/)
  end

  private def self.convert_to_numeric(isbn : String)
    isbn
      .chars
      .select { |c| c != '-' }
      .map { |c| c == 'X' ? 10 : c.to_i }
  end

  private def self.validate(isbn_as_numeric : Array(Int32)) : Bool
    isbn_as_numeric
      .reverse
      .map_with_index { |i, j| i * (j + 1) }
      .sum
      .divisible_by?(11)
  end

end
