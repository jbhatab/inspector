module ApplicationHelper

  def body_classes
    qualified_controller_name = controller.controller_path.gsub('/','-')
    basic_body_class = "#{qualified_controller_name.gsub('_', '-')} #{qualified_controller_name.gsub('_', '-')}-#{controller.action_name}"
    basic_body_class
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      type = :error   if type == :alert
      text = "<script>toastr.options.positionClass= 'toast-top-right';toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

end
