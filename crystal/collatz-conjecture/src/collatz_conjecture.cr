# Please implement your solution to collatz-conjecture in this file
class CollatzConjecture

    def self.steps(n : Int32)
        raise ArgumentError.new "Invalid value #{n}" unless n > 0
        steps = 0
        while n > 1
            n = n.even? ? (n / 2).to_i : 3 * n + 1
            steps = steps + 1
        end
        steps
    end


end
