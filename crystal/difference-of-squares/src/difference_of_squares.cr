# Please implement your solution to difference-of-squares in this file
class Squares

    def self.square_of_sum(n : Int32)
        (1..n).sum ** 2
    end

    def self.sum_of_squares(n : Int32)
        (1..n).sum { |i| i ** 2 }
    end

    def self.difference_of_squares(n : Int32)
        self.square_of_sum(n) - self.sum_of_squares(n)
    end
end