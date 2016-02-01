class Admin::MenusController < AdminController


  # GET /operas/1
  # GET /operas/1.json
  def show
  end

  # GET /operas/new
  def new
    @menu = Menu.new
    render '_form'
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @menu = Menu.new(menu_params)
    @menu.website = @website

    respond_to do |format|
      if @menu.save
        format.html { redirect_to admin_menus_path, notice: 'menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render '_form' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to admin_menus_path, notice: 'menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :url, :position)
    end
end