module ApplicationHelper
  def bootstrap_class_for_message(flash_type)
    message = { error: 'danger', alert: 'warning', notice: 'info' }
    message[flash_type.to_sym] || flash_type.to_s
  end
end
