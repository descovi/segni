class Admin::SimpleBlocksController < AdminController
  
  def create
    page = Page.find(params[:page_id])
    s = SimpleBlock.new(custom_type: params['custom_type'])
    s.page = page
    s.save
    redirect_to [:edit, :admin, page]
  end
  
  def update
    block = SimpleBlock.find(params[:id])
    block.update(params[:simple_block].permit!)
    return redirect_to [:edit, :admin, block.page]
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
end