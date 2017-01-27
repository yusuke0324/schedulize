module ApplicationHelper
  def current_month
    t = Time.now
    t.month
  end

  def current_day
    t = Time.now
    t.day
  end

  def current_year
    t = Time.now
    t.year
  end

  def month_string(num)
    if num == 1
      "January"
    elsif num == 2
      "February"
    elsif num == 3
      "March"
    elsif num == 4
      "April"
    elsif num == 5
      "May"
    elsif num == 6
      "June"
    elsif num == 7
      "July"
    elsif num == 8
      "August"
    elsif num == 9
      "September"
    elsif num == 10
      "October"
    elsif num == 11
      "November"
    elsif num == 12
      "December"
    end
  end

  def display_time(datetime)
    t = datetime.to_time
    min = string_increase_for_min(t.min)
    if min.to_s.length == 1 then min = "0" + min end
    "#{t.hour}:#{min}"
  end

  def display_date_time(datetime)
    month = month_string(datetime.month.to_i)
    day = datetime.day
    "#{month} #{day} #{display_time(datetime)}"
  end
end
