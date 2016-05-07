class Admin::ImagesController < AdminController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def new
    @image = Image.new
    render 'form', layout: 'admin-page'
  end

  def edit
    @preview = @image.simple_block.page
    render 'form', layout: 'admin-page'
  end

  def update
    @preview = @image
    respond_to do |format|
      if @image.update(images_params)
        format.html { redirect_to [:edit, :admin, @image], notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def images_params
    params.require(:image).permit(:description)
  end

  def set_image
    @image = @website.images.find params[:id]
  end

end