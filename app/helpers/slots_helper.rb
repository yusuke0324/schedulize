module SlotsHelper

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
    min = t.min.to_s
    if min.to_s.length == 1 then min = "0" + min end
    "#{t.hour}:#{min}"
  end


  def amount_of_students(slot)
    slot.students.count
  end

  def full?(slot)
    slot.capacity <= amount_of_students
  end

  def sort_by_start(slots)
    slots.sort_by(&:start_time).reverse
  end
end
