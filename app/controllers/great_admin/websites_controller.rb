class GreatAdmin::WebsitesController < GreatAdminController
    before_action :set_website, only: [:show, :edit, :update, :destroy]

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
    if @website.save
      redirect_to [:great_admin, Website], notice: 'website was successfully created.'
    else
      render :new
    end
  end

  def update
    if @website.update(website_params)
      redirect_to [:great_admin, @website]
    else
      render :edit
    end
  end
  
  def destroy
    @website = Website.find params[:id]
    @website.destroy
    redirect_to [:great_admin, Website]
  end

  def website_params
    params.require(:website).permit(:name, :year, :archive_index, :website_id, :image)
  end

  def set_website
    @website = Website.find params[:id]
  end

end