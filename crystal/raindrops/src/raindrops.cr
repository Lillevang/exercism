class Raindrops

    def self.convert(n : Int32)
        output = ""
        output += "Pling" if n.divisible_by? 3
        output += "Plang" if n.divisible_by? 5
        output += "Plong" if n.divisible_by? 7
        output.empty? ? n.to_s : output
    end
end