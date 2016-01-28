module ApplicationHelper
  def path_for_create_block custom_type
    [:admin, SimpleBlock.new, page_id: @page.id ,custom_type: custom_type]
  end
  
  def path_exists?(path)
    begin
      Rails.application.routes.recognize_path(path)
    rescue
      return false
    end

    true
  end

end