class Triangle
    
    def initialize(@sides : Tuple(Int32 | Float64, Int32 | Float64, Int32 | Float64))
        raise ArgumentError.new "No sides of length 0 is allowed" if @sides.includes?(0)
        raise ArgumentError.new "Inequal sides. Any 2 sides must be greater than or equal to the third" if inequality?
    end

    def equilateral?
        @sides.to_set.size == 1
    end

    def isosceles?
        @sides.to_set.size >= 1 && !scalene?
    end

    def scalene?
        @sides.to_set.size == 3
    end
    
    def inequality?
        x = @sides.to_a.sort
        x[0] + x[1] < x[2]
    end
end