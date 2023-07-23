module ApplicationHelper
  def valid_time_format(date)
    date.strftime('%Y-%m-%dT%H:%M:%S')
  end
end
