module LeadsHelper
  def human_time(t)
    now = Time.now.localtime
    time = t.localtime
    
    if time.year < now.year
      time.strftime("%d %b %Y")
    elsif time.yday < now.yday-6
      time.strftime("%d %b")
    elsif time.yday < now.yday-1
      time.wday
    elsif time.yday == now.yday-1
      "yesterday"
    else
      time.strftime("%H:%M")
    end
  end
  
  def human_date(d)
    return nil if d.nil?
    today = Date.today
    
    if d == today
      "today"
    elsif d == (today-1)
      "yesterday"
    else
      d.strftime("%a %d-%b-%Y")
    end
  end
end
