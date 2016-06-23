class Admin::WebsitesController < AdminController
  
  def update
    if  @website.update(website_params)
      render js: 'refreshIframe()' if request.xhr?
    else
      logger.warn @website.errors.inspect
      raise 'error in website#update'
    end
  end

  def website_params
    params.require(:website).permit(:template_id, 
                                    :css,
                                    :js,
                                    :logo,
                                    :head,
                                    :button_open_menu,
                                    :button_language)
                                    
  end
end