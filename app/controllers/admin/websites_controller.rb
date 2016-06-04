class Admin::WebsitesController < AdminController
  
  def set_first_page
  end
  
  def update
    @website.update(website_params)
    if request.xhr?
      render format: :js, text: 'refreshIframe()'
    else
      redirect_to :back
    end
  end

  def website_params
    params.require(:website).permit(:template_id, 
                                    :css, 
                                    :js,
                                    :logo,
                                    :head,
                                    :button_open_menu,
                                    :user_ids => [])
                                    
  end
end