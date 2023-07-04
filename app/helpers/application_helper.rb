module ApplicationHelper
  def valid_time_format
    Time.zone.now.strftime('%Y-%m-%dT%H:%M:%S')
  end
end
