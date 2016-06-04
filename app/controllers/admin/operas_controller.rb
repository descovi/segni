class Admin::OperasController < AdminController
  before_action :set_opera, only: [:show, :edit, :update, :destroy]


  # GET /operas/1
  # GET /operas/1.json
  def show
  end

  # GET /operas/new
  def new
    @opera = Opera.new
  end

  # GET /operas/1/edit
  def edit
    @preview = @opera
  end

  # POST /operas
  # POST /operas.json
  def create
    @opera = Opera.new(opera_params)
    @opera.website = @website
    respond_to do |format|
      if @opera.save
        format.html { redirect_to [:edit, :admin, @opera], notice: 'Opera was successfully created.' }
        format.json { render :show, status: :created, location: @opera }
      else
        format.html { render :new }
        format.json { render json: @opera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operas/1
  # PATCH/PUT /operas/1.json
  def update
    @preview = @opera
    respond_to do |format|
      if @opera.update(opera_params)
        format.html { redirect_to [:edit, :admin, @opera], notice: 'Opera was successfully updated.' }
        format.json { render :show, status: :ok, location: @opera }
      else
        format.html { render :edit }
        format.json { render json: @opera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operas/1
  # DELETE /operas/1.json
  def destroy
    @opera.destroy
    respond_to do |format|
      format.html { redirect_to admin_operas_path, notice: 'opera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_space_horizontal
    render text: set_attribute_and_return_result('horizontal_space', params)
  end

  def set_space_vertical
    render text: set_attribute_and_return_result('vertical_space', params)
  end

  def set_pos_vertical
    render text: set_attribute_and_return_result('pos_y', params)
  end

  private
  def set_attribute_and_return_result column, params
    opera = Opera.find params[:id]
    opera[column] = params[:new_value]
    opera.save
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_opera
      @opera = Opera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opera_params
      params.require(:opera).permit!#.permit(
        # :name, 
        # :year, 
        # :archive_index, 
        # :website_id, 
        # :image, 
        # :description,
        # :website_id)
    end
end
