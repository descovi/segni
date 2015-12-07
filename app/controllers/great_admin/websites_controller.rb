class GreatAdmin::WebsitesController < GreatAdminController
  
  def index
    @websites = Website.all
  end
  
  def new
    @website = Website.new
  end
  
  def show
    @website = Website.find params[:id]
  end

  def edit
    @website = Website.find params[:id]
  end
  
  def create
    @website = Website.new(website_params)

    respond_to do |format|
      if @website.save
        format.html { redirect_to [:great_admin, Website], notice: 'website was successfully created.' }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @website = Website.find params[:id]
    @website.destroy
    respond_to do |format|
      format.html { redirect_to [:great_admin, Website], notice: 'Opera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def website_params
    params.require(:website).permit(:name, :year, :archive_index, :website_id, :image)
  end

end