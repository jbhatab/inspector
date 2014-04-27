module ApplicationHelper

  def body_classes
    qualified_controller_name = controller.controller_path.gsub('/','-')
    basic_body_class = "#{qualified_controller_name.gsub('_', '-')} #{qualified_controller_name.gsub('_', '-')}-#{controller.action_name}"
    basic_body_class
  end

end
