class Admin::ImagesController < AdminController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def new
    @image = Image.new
    render 'form', layout: 'admin-page'
  end

  def edit
    @preview = @page
    render 'form', layout: 'admin-page'
  end
  private

  def images_params
    params.require(:image).permit(:description)
  end

  def set_image
    @image = @website.images.find params[:id]
  end


end