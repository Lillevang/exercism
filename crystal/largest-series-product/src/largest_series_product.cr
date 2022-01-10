# Please implement your solution to largest-series-product in this file
class Series

  @series : Array(Int64)

  def initialize(series_s : String)
    @series = series_s.chars.map(&.to_i64)
  end

  def largest_product(span : Int32)
    raise ArgumentError.new "Span cannot be negative" if span < 0
    raise ArgumentError.new "Span cannot exceed the length of the series" unless @series.size >= span
    return 1 if @series.empty? || span == 0
    return @series.each_cons(span).map(&.product 1_i64).max
  end
end
