class ProteinTranslation

  PROTEIN_MAP = {
  "AUG" => "Methionine",
  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine",
  "UUA" => "Leucine",
  "UUG" => "Leucine",
  "UCU" => "Serine",
  "UCC" => "Serine",
  "UCA" => "Serine",
  "UCG" => "Serine",
  "UAU" => "Tyrosine",
  "UAC" => "Tyrosine",
  "UGU" => "Cysteine",
  "UGC" => "Cysteine",
  "UGG" => "Tryptophan",
  "UAA" => "STOP",
  "UAG" => "STOP",
  "UGA" => "STOP"}

  def self.proteins(rna_sequence : String)
    rna_sequence
  	.chars
  	.in_groups_of(3)
  	.map { |c| c.join }
  	.map { |c| PROTEIN_MAP[c] }
  	.take_while { |p| p != "STOP" }
  end
end
