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
  end

  # POST /operas
  # POST /operas.json
  def create
    @opera = Opera.new(opera_params)
    respond_to do |format|
      if @opera.save
        format.html { redirect_to admin_operas_path, notice: 'Opera was successfully created.' }
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
    respond_to do |format|
      if @opera.update(opera_params)
        format.html { redirect_to admin_operas_path, notice: 'opera was successfully updated.' }
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

  private
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