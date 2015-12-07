class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def new
    @page = Page.new
    render 'form'
  end

  def edit
    render 'form'
  end

  def create
    @page = Page.new(pages_params)
    @page.website = @website
    return redirect_to action: :index if @page.save
    render 'form'
  end

  def update
    return redirect_to [:admin, Page] if @page.update(pages_params)
    render :form
  end
  
  def destroy
    @page.destroy
    redirect_to [:admin, Page]
  end
  
  def pages_params
    params.require(:page).permit(*Page.globalize_attribute_names)
  end

  def set_page
    @page = Page.find params[:id]
  end

end