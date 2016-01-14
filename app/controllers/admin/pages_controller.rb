class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def new
    @page = Page.new
    render 'form', layout: 'admin-page'
  end

  def edit
    render 'form', layout: 'admin-page'
  end

  def create
    @page = Page.new(pages_params_param_without_blank_values)
    @page.website = @website
    return redirect_to action: :index if @page.save
    render 'form'
  end

  def update
    return redirect_to [:admin, Page]  if @page.update(pages_params_param_without_blank_values)
    render :form
  end
  
  def destroy
    @page.destroy
    redirect_to [:admin, Page]
  end
  
  
  private

  def pages_params
    params.require(:page).permit(*Page.globalize_attribute_names)
  end

  def set_page
    @page = Page.friendly.find params[:id]
  end

  # This function avoid Globalize gem to create blank records
  def pages_params_param_without_blank_values
    cooked_params = pages_params
    
    if cooked_params[:title_en].blank?
      cooked_params.delete :title_en
      cooked_params.delete :content_en
    end

    if cooked_params[:title_it].blank?
      cooked_params.delete :title_it
      cooked_params.delete :content_it
    end

    return cooked_params
  end
end