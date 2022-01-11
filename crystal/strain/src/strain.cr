class Array(T)

    def keep
        arr = [] of T
        each { |element| arr << element if yield(element) }
        arr
    end

    def discard
        keep { |element| !yield(element) }
    end

end