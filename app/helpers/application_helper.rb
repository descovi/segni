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

  def container_fluid_or_not block
    return "container-fluid" if block.container_fluid
    "container"
  end

  def padding_for_elements block
    "padding: #{block.padding}px" if block.padding.present?
  end

  def columns_for_elements block
    classe = "col-sm-4 col-xs-12"
    classe.gsub!("col-sm-4", "col-sm-#{12/block.num_elements}") if block.num_elements.present?
    classe.gsub!("col-xs-12", "col-xs-#{12/block.num_elements_xs}") if block.num_elements_xs.present?
    return classe
  end
  
  def is_http_url? url
    if url.include? 'http://' or url.include? 'https://' or url.include? 'www.'
      true
    else
      false
    end
  end

end