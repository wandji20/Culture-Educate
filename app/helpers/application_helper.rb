module ApplicationHelper
  def flash_message
    if notice
      notice
    elsif alert
      alert
    end
  end
end
