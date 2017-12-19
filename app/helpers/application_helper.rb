module ApplicationHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      next if type == :timeout
      type = :success if type == 'notice'
      type = :danger   if type == 'alert'
      text = content_tag(:div,
       content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
       message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end

  def is_active?(expected_value, actual_value)
    expected_value.include?(actual_value) ? 'active' : ''
  end

  def qiniu_url(url)
    "http://oy9ymxcni.bkt.clouddn.com/#{url}"
  end

  def current_city
    unless session[:current_city_id]
      session[:current_city_id] = current_user.cities.first.id if current_user.cities.first
    end
    if session[:current_city_id]
      @current_city ||= City.find(session[:current_city_id])
    else
      @current_city = nil
    end
  end

  def date_time time
    if time
      Time.at(time).strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end