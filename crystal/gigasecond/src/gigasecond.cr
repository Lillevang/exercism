# Please implement your solution to gigasecond in this file
module Gigasecond
  extend self

  def from(t : Time)
    t + 10e8.seconds
  end

end
