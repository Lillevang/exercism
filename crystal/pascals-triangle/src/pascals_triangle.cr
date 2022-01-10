require "big"

class PascalsTriangle

  # Any value at any place can be found using: n! / (k! * (n-k)!)
  # Where n == rownumber and k == index in row

  def self.rows(number_of_rows : Int32)
    triangle = [] of Array(Int32)
    cur_row_length = 0
    (0...number_of_rows).each { |n|
      row = [] of Int32
      (0..cur_row_length).each { |k|
        row << n_choose_k(n, k)
      }
      triangle << row
      cur_row_length = cur_row_length.succ
    }
    triangle
  end

  private def self.n_choose_k(n : Int32, k : Int32) : Int32
    cur_n = BigInt.new(n)
    cur_k = BigInt.new(k)
    (cur_n.factorial / (cur_k.factorial * (cur_n - cur_k).factorial)).to_i
  end

end
