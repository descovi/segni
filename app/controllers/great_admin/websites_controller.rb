class GreatAdmin::WebsitesController < GreatAdminController
  before_action :set_website, only: [:show, :edit, :update, :destroy]

  def index
    @websites = Website.all
  end
  
  def new
    @website = Website.new
  end
  
  def create
    @website = Website.new(website_params)
    new_page = Page.new(title: 'Welcome')
    @website.pages << new_page
    @website.first_page = new_page
    return redirect_to [:great_admin, Website], notice: 'Website created' if @website.save
    render :new
  end

  def update
    return redirect_to [:great_admin, @website] if @website.update(website_params)
    render :edit
  end
  
  def destroy
    @website.destroy
    redirect_to [:great_admin, Website]
  end

  def website_params
    params.require(:website).permit(:name,
                                    :name_slug, 
                                    :primary_color, 
                                    :secondary_color, 
                                    :user_id)
  end

  def set_website
    @website = Website.find params[:id]
  end

end