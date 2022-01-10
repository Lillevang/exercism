# Please implement your solution to binary in this file
module Binary
    extend self

    def to_decimal(binary : String)
      # The way I would actually go about solving this problem
      binary.to_i(2)
    end

    def to_decimal(binary : String)
      binary
        .chars
        .reverse
        .map(&.to_i)
        .map_with_index do |bit, i| 
          raise ArgumentError.new "invalid value: #{bit}" unless [0, 1].includes?(bit)
          (2 ** i) * bit
        end.sum
    end
    
end