module AtbashCipher
  extend self

  ALPHA = ('a'..'z').join

  def encode(s)
    decode(s).scan(/.{1,5}/).map(&.[0]).join(" ")
  end

  def decode(s)
    s.downcase.gsub(/[^a-z0-9]/, "").tr(ALPHA, ALPHA.reverse)
  end
end
