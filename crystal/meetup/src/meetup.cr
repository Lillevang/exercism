class Meetup

  def self.meetup(year, month, descriptor, day)
    date = Time.utc(year, month, 1).at_end_of_month
    date_range = get_date_range(descriptor, date)
    dates = date_range.map { |d| Time.utc(year, month, d) }
    output = dates.find{ |d| d.day_of_week == Time::DayOfWeek.parse?(day) }
    output.not_nil!.to_s("%Y-%m-%d")
  end

  private def self.get_date_range(descriptor, date)
    case descriptor
    when "teenth"
      13..19
    when "first"
      1..7
    when "second"
      8..14
    when "third"
      15..21
    when "fourth"
      22..28
    when "last"
      date.day - 6 .. date.day
    else
      raise ArgumentError.new "Invalid descriptor"
    end
  end



end
