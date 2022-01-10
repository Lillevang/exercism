# Please implement your solution to etl in this file
class ETL
  def self.transform(legacy : Hash(String, Array(String))) : Hash(String, Int32)
    legacy.flat_map do |v, k|
      k.map(&.downcase).product([v.to_i])
    end.to_h
  end
end
