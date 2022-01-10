# Please implement your solution to armstrong-numbers in this file
module ArmstrongNumbers
    extend self

    def armstrong_number?(n : Int32) : Bool
        n.digits.reduce(0) {|acc, i| acc + i ** n.digits.size} == n
    end
    
end