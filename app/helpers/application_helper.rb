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

  def margin_for_elements block
    "#{block.margin}px" if block.margin.present? 
  end

  def columns_for_elements block
    return "col-sm-4" if block.num_elements.blank?
    "col-sm-#{12/block.num_elements}"
  end

  def operas_from_tag_and_website tag, website
    if tag.present?
      tags = tag.split(" ")
      Opera.tagged_with(tags, any: true).where(website: website).order('archive_index')
    else
      Opera.where(website: website).order('archive_index')
    end
  end

end