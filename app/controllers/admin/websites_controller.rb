class Admin::WebsitesController < AdminController
  def set_first_page
  end
  def update
    @website.update(website_params)
    redirect_to :back
  end
  def website_params
    params.require(:website).permit(:template_id, :css, :js)
  end
end