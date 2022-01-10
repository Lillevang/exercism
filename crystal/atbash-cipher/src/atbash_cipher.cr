# Please implement your solution to atbash-cipher in this file
module AtbashCipher
  extend self

	ALPHABET = ('a'..'z').to_a
	MAPPING = Hash.zip(ALPHABET, ALPHABET.reverse)

  def encode(s : String) : String
		s
			.downcase
			.chars
			.select { |c| c.ascii_alphanumeric? }
			.map { |c| MAPPING.has_key?(c) ? MAPPING[c] : c}
			.in_groups_of(5)
			.map(&.join)
			.join(" ")
  end

	def decode(s : String) : String
		s.chars
			.select { |c| c.ascii_alphanumeric? }
			.reduce("") { |acc, c| acc + (MAPPING.has_key?(c) ? MAPPING[c] : c) }
	end
	
end
