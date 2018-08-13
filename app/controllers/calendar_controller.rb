class CalendarController < ApplicationController

  def show
    @nav_path = '/events/calendar'
    @cal_url = "https://calendar.google.com/calendar/embed?src=5cm12mp34ehii1teb3oia2or0o%40group.calendar.google.com&ctz=America%2FLos_Angeles"
  end

end
