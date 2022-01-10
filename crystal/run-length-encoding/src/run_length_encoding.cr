class RunLengthEncoding

    def self.encode(s : String)
        compressed = ""
        s.each_char.chunk(&.itself).each do |a|
            compressed += "#{a[1].size if a[1].size > 1}#{a[0]}"
        end
        compressed
    end

    def self.decode(s : String)
        s.gsub(/\d*\D/) { |r| r.size == 1 ? r[-1] : r[-1].to_s.* r.rchop.to_i }
    end
end