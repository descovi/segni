class Admin::WebsitesController < AdminController
  def update
    website = Website.find(params[:id])
    website.update(params[:website].permit!)
    redirect_to :back
  end
end