class PagesController < ApplicationController
  def show    
    @page = find_page params[:id]

    if @page.nil?
      @page = find_page_other_languages [:en, :it]  
      redirect_to @page if @page.present?
    end

    
    raise ActiveRecord::RecordNotFound if @page.nil?
    
    @title = @page.title
  end

  private

  def find_page_other_languages languages
    page = nil
    languages.each do |language|
      page = I18n.with_locale(language) { find_page params[:id] }
      break if page.present?
    end
    return page
  end
  
  def find_page _slug
    result = Page.where(website: @website).friendly.exists?(_slug)
    return Page.where(website: @website).friendly.find _slug if result == true
    nil
  end

end