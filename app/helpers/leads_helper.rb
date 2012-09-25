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
end
