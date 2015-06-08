module ApplicationHelper

  def resource_display_name(model_class)
    model_class.to_s.titleize
  end

  def resource_display_path_name(model_class)
    model_class.to_s.tableize
  end
end
