module ApplicationHelper
  def current_month
    t = Time.now
    t.month
  end

  def current_year
    t = Time.now
    t.year
  end
end
