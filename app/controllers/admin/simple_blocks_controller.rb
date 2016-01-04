class Admin::SimpleBlocksController < AdminController
  layout 'admin-page'
  def create
    page = Page.find(params[:page_id])
    s = SimpleBlock.new(custom_type: params['custom_type'])
    s.page = page
    s.save
    redirect_to [:edit, :admin, page]
  end
  
  def update
    block = SimpleBlock.find(params[:id])
    block.update(simple_block_params)
    redirect_to [:edit, :admin, block.page, simple_block_updated: block.id], locale: 'it'
  end

  def destroy
    s = SimpleBlock.find(params[:id])
    s.destroy
    return redirect_to [:edit, :admin, s.page]
  end

  def sort
    block = SimpleBlock.find(params[:simple_block_id])
    block.insert_at(params[:position].to_i)
    render nothing: true
  end

  def simple_block_params
    params.require(:simple_block).permit(
      :background_image, 
      :page_id,
      :title,
      :content,
      :title_it,
      :content_it,
      :title_en,
      :content_en,
      :action,
      :action_it,
      :action_en,
      :full_height,
      :background_color,
      :image_1,
      :image_2,
      :image_3,
      :image_4,
      :image_5,
      :image_6,
      :custom_type,
      :colors_inverted,
      :position,
      :menu_title,
      links_attributes: [:name, :url, :background_image, :simple_block_id, :_destroy, :id]
    )
  end
end