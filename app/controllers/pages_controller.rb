class PagesController < ApplicationController
  def show    
    @page = find_page params[:id]
    if @page.nil?
      @page = find_page_other_languages [:en, :it]
      redirect_to @page
    end
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
  
  def find_page _id
    Page.where(website: @website).where(slug: _id).take
  end

end