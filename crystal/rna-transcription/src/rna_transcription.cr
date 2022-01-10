class RnaComplement
    def self.of_dna(s : String)
    	s.tr("ACTG", "UGAC")
    end
end