class GreatAdmin::SurfacesController < GreatAdminController

  before_action :set_surface, only: [:show, :edit, :update, :destroy]

  def index
    @surfaces = Surface.all
  end

  def new
    @surface = Surface.new
  end

  def create
    @surface = Surface.new(surface_params)

    respond_to do |format|
      if @surface.save
        format.html { redirect_to [:great_admin, Surface], notice: 'surface was successfully created.' }
        format.json { render :show, status: :created, location: @surface }
      else
        format.html { render :new }
        format.json { render json: @surface.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @surface.update(surface_params)
      return redirect_to [:great_admin, Surface] 
    end
    render :edit
  end


  def destroy
    @surface.destroy
    redirect_to [:great_admin, Surface]
  end


  def surface_params
    params.require(:surface).permit(:name, :name_it, :name_en)
  end

  def set_surface
    @surface = Surface.find params[:id]
  end

end