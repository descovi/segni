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

  def operas_from_tag_and_website tag, website
    if tag.present?
      tags = tag.split(" ")
      Opera.tagged_with(tags, any: true).where(website: website).order('archive_index')
    else
      Opera.where(website: website).order('archive_index')
    end
  end

end